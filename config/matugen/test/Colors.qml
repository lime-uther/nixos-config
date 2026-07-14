pragma Singleton
import Quickshell
import QtQuick

// qmllint disable
Singleton {
  readonly property color primary:                   "#8ccff0"
  readonly property color on_primary:                "#003547"
  readonly property color primary_container:         "#004d65"
  readonly property color on_primary_container:      "#bfe9ff"
  readonly property color inverse_primary:           "#146683"
  readonly property color primary_fixed:             "#bfe9ff"
  readonly property color primary_fixed_dim:         "#8ccff0"
  readonly property color on_primary_fixed:          "#001f2a"
  readonly property color on_primary_fixed_variant:  "#004d65"

  readonly property color secondary:                 "#b4cad6"
  readonly property color on_secondary:              "#1f333d"
  readonly property color secondary_container:       "#364954"
  readonly property color on_secondary_container:    "#d0e6f2"
  readonly property color secondary_fixed:           "#d0e6f2"
  readonly property color secondary_fixed_dim:       "#b4cad6"
  readonly property color on_secondary_fixed:        "#081e27"
  readonly property color on_secondary_fixed_variant:"#364954"

  readonly property color tertiary:                  "#c7c2ea"
  readonly property color on_tertiary:               "#2f2d4c"
  readonly property color tertiary_container:        "#464364"
  readonly property color on_tertiary_container:     "#e4dfff"
  readonly property color tertiary_fixed:            "#e4dfff"
  readonly property color tertiary_fixed_dim:        "#c7c2ea"
  readonly property color on_tertiary_fixed:         "#1a1836"
  readonly property color on_tertiary_fixed_variant: "#464364"

  readonly property color error:                     "#ffb4ab"
  readonly property color on_error:                  "#690005"
  readonly property color error_container:           "#93000a"
  readonly property color on_error_container:        "#ffdad6"

  readonly property color surface_dim:               "#0f1417"
  readonly property color surface:                   "#0f1417"
  readonly property color surface_tint:              "#8ccff0"
  readonly property color surface_bright:            "#353a3d"
  readonly property color surface_container_lowest:  "#0a0f12"
  readonly property color surface_container_low:     "#171c1f"
  readonly property color surface_container:         "#1b2023"
  readonly property color surface_container_high:    "#262b2e"
  readonly property color surface_container_highest: "#303538"

  readonly property color on_surface:                "#dfe3e7"
  readonly property color on_surface_variant:        "#c0c8cd"

  readonly property color outline:                   "#8a9297"
  readonly property color outline_variant:           "#40484c"

  readonly property color inverse_surface:           "#dfe3e7"
  readonly property color inverse_on_surface:        "#2c3134"

  readonly property color surface_variant:           "#40484c"
  readonly property color background:                "#0f1417"
  readonly property color on_background:             "#dfe3e7"

  readonly property color shadow:                    "#000000"
  readonly property color scrim:                     "#000000"
  readonly property color source_color:              "#78c0e2"
}
