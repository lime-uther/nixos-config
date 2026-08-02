import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Rectangle {
  Layout.fillWidth: true
  Layout.fillHeight: true
  Layout.preferredWidth: 1
  color: "transparent"

  RowLayout {
    anchors {
      left: parent.left
      leftMargin: 10
    }
    height: parent.height

    Repeater {
      model: Hyprland.workspaces.values.filter(ws => ws.id >= 0)

      Rectangle {

        required property int index
        required property var modelData

        property bool isWindowed: modelData.toplevels.values.length > 0
        property bool isFocused: modelData.focused

        implicitHeight: isFocused ? 9 : 7
        implicitWidth: isFocused ? 20 : height
        color: isFocused ? "#89b4fa" : isWindowed ? "#bfc6d4" : "#2f2e3e"

        radius: width / 2
      }
    }
  }
}

