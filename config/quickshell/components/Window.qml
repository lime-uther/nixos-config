import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import qs.components.taskbar


Scope {
  id: root

  WlrLayershell {
    namespace: "taskbar"

    color: "transparent"
    height: 27
    width: 27

    anchors {
      top: true
      left: true
      right: true
    }

    Rectangle {

      Rectangle {
        id: border
        anchors.bottom: parent.bottom

        implicitHeight: 2
        implicitWidth:  parent.width
        color: "#2f2e3e"
      }

      anchors.fill: parent

      color: "#11111b"


      RowLayout {
        anchors.fill: parent

        L_Section{ borderHeight: border.height }
        C_Section{ borderHeight: border.height }
        R_Section{ borderHeight: border.height }
      }
    }

  }
}
