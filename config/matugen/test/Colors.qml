pragma Singleton
import Quickshell
import QtQuick

// qmllint disable
Singleton {
  readonly property color primary:                   "#9ecafc"
  readonly property color on_primary:                "#003356"
  readonly property color primary_container:         "#144974"
  readonly property color on_primary_container:      "#d0e4ff"
  readonly property color inverse_primary:           "#33618d"
  readonly property color primary_fixed:             "#d0e4ff"
  readonly property color primary_fixed_dim:         "#9ecafc"
  readonly property color on_primary_fixed:          "#001d34"
  readonly property color on_primary_fixed_variant:  "#144974"

  readonly property color secondary:                 "#bac8db"
  readonly property color on_secondary:              "#243240"
  readonly property color secondary_container:       "#3b4857"
  readonly property color on_secondary_container:    "#d6e4f7"
  readonly property color secondary_fixed:           "#d6e4f7"
  readonly property color secondary_fixed_dim:       "#bac8db"
  readonly property color on_secondary_fixed:        "#0f1d2a"
  readonly property color on_secondary_fixed_variant:"#3b4857"

  readonly property color tertiary:                  "#d5bee5"
  readonly property color on_tertiary:               "#3a2a48"
  readonly property color tertiary_container:        "#514060"
  readonly property color on_tertiary_container:     "#f0dbff"
  readonly property color tertiary_fixed:            "#f0dbff"
  readonly property color tertiary_fixed_dim:        "#d5bee5"
  readonly property color on_tertiary_fixed:         "#241532"
  readonly property color on_tertiary_fixed_variant: "#514060"

  readonly property color error:                     "#ffb4ab"
  readonly property color on_error:                  "#690005"
  readonly property color error_container:           "#93000a"
  readonly property color on_error_container:        "#ffdad6"

  readonly property color surface_dim:               "#101418"
  readonly property color surface:                   "#101418"
  readonly property color surface_tint:              "#9ecafc"
  readonly property color surface_bright:            "#36393e"
  readonly property color surface_container_lowest:  "#0b0e12"
  readonly property color surface_container_low:     "#191c20"
  readonly property color surface_container:         "#1d2024"
  readonly property color surface_container_high:    "#272a2f"
  readonly property color surface_container_highest: "#32353a"

  readonly property color on_surface:                "#e0e2e8"
  readonly property color on_surface_variant:        "#c2c7cf"

  readonly property color outline:                   "#8c9199"
  readonly property color outline_variant:           "#42474e"

  readonly property color inverse_surface:           "#e0e2e8"
  readonly property color inverse_on_surface:        "#2d3135"

  readonly property color surface_variant:           "#42474e"
  readonly property color background:                "#101418"
  readonly property color on_background:             "#e0e2e8"

  readonly property color shadow:                    "#000000"
  readonly property color scrim:                     "#000000"
  readonly property color source_color:              "#7d9abb"
}
