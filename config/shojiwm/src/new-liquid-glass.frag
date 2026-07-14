// Reference : https://medium.com/@aghajari/liquid-glass-ios-effect-explanation-dabadd6414ae

uniform float glass_width_px;
uniform float glass_height_px;
uniform float glass_radius_px;
uniform float distortion_depth;
uniform float distortion_strength;
uniform float chromatic_shift_px;
uniform float glass_tint;

float sdf(vec2 p, vec2 b, float r) {
    vec2 d = abs(p) - b + vec2(r);
    return min(max(d.x, d.y), 0.0) + length(max(d, 0.0)) - r;
}

vec2 safeNormalize(vec2 value) {
    float scale = max(max(abs(value.x), abs(value.y)), 0.0001);
    vec2 scaled = value / scale;
    return scaled / max(length(scaled), 0.0001);
}

vec3 getTextureColorAt(EffectContext effect, vec2 content_coord) {
    vec2 sample_uv = clamp(
        effect_texture_uv_from_content_px(effect, content_coord),
        vec2(0.0),
        vec2(1.0)
    );
    return texture2D(tex, sample_uv).rgb;
}

vec4 shader_main(EffectContext effect) {
    vec2 rect_size = effect.content_rect_px.zw;
    vec2 fragCoord = effect_content_px(effect);
    vec2 glassSize = vec2(
        glass_width_px > 0.0 ? glass_width_px : rect_size.x,
        glass_height_px > 0.0 ? glass_height_px : rect_size.y
    );
    vec2 glassCenter = rect_size * 0.5;
    vec2 glassCoord = fragCoord - glassCenter;

    float size = max(min(glassSize.x, glassSize.y), 1.0);
    // Keep squared values inside mediump range. Some drivers evaluate length()
    // with 16-bit intermediates while others silently promote them.
    float sdfScale = max(max(glassSize.x, glassSize.y), 1.0);
    float inversedSDF = -sdf(
        glassCoord / sdfScale,
        glassSize * 0.5 / sdfScale,
        glass_radius_px / sdfScale
    ) * sdfScale / size;

    if (inversedSDF < 0.0) {
        return vec4(getTextureColorAt(effect, fragCoord), 1.0);
    }

    vec2 normalizedGlassCoord = safeNormalize(glassCoord);
    float distFromCenter = 1.0 - clamp(inversedSDF / max(distortion_depth, 0.0001), 0.0, 1.0);

    // float bezelCurve = smoothstep(0.0, 1.0, distFromCenter); 
    float distortion = 1.0 - sqrt(max(1.0 - pow(distFromCenter, 2.0), 0.0));

    // vec2 offset = bezelCurve * normalizedGlassCoord * glassSize * 0.5 * distortion_strength;
    vec2 offset = distortion * normalizedGlassCoord * glassSize * 0.5 * distortion_strength;
    vec2 glassColorCoord = fragCoord - offset; 

    float edge = smoothstep(0.0, 0.02, inversedSDF);
    vec2 shift = normalizedGlassCoord * edge * chromatic_shift_px;

    vec3 glassColor = vec3(
        getTextureColorAt(effect, glassColorCoord - shift).r,
        getTextureColorAt(effect, glassColorCoord).g,
        getTextureColorAt(effect, glassColorCoord + shift).b
    );

    float luma = dot(glassColor, vec3(0.299, 0.587, 0.114));
    glassColor = mix(vec3(luma), glassColor, 1.4);

    float surfaceCurvature = 0.8;
    // vec3 normal = normalize(vec3(normalizedGlassCoord * bezelCurve * surfaceCurvature, 1.0));
    vec3 normal = normalize(vec3(normalizedGlassCoord * distFromCenter * surfaceCurvature, 1.0));

    vec3 lightDir = normalize(vec3(-0.5, -0.8, 0.6)); 

    float shininess = 60.0;
    float specular = pow(max(dot(normal, lightDir), 0.0), shininess) * distortion_strength * 2.0;

    float rimPower = pow(distFromCenter, 2.0);
    // float edgeGlare = pow(max(dot(normal, lightDir), 0.0), 4.0) * rimPower;
    // float edgeShadow = pow(max(dot(normal, -lightDir), 0.0), 2.0) * rimPower;

    vec3 vibrantEdge = glassColor * 2.5; 

    glassColor = mix(glassColor, vibrantEdge, rimPower * 0.6) + vec3(specular);

    // glassColor += vec3(edgeGlare * 0.8) - vec3(edgeShadow * 0.5) + vec3(specular);

    return vec4(glassColor, 1.0);
}
