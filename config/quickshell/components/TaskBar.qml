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
    height: 25
    width: 25

    anchors {
      top: true
      left: true
      right: true
    }

    Rectangle {

      anchors.fill: parent

      color: "#11111b"

      RowLayout {
        anchors.fill: parent

        BotSection{}
        CenSection{}
        TopSection{}

      }
    }
  }
}
