pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Rectangle {
  id: root

  Layout.fillWidth: true
  Layout.fillHeight: true
  Layout.preferredWidth: 1
  color: "transparent"

  required property int borderHeight
  
  RowLayout {
    anchors {
      left: parent.left
      leftMargin: 10
    }
    spacing: 0

    Repeater {
      model: Hyprland.workspaces.values.filter(ws => ws.id >= 0)

      Rectangle {

        required property int index
        required property var modelData

        property bool isWindowed: modelData.toplevels.values.length > 0
        property bool isFocused: modelData.focused

        implicitHeight: root.height
        implicitWidth:  height

        color: "transparent"

        Text {
          text: parent.modelData.id
          color: parent.isWindowed ? "#bfc6d4" : "#2f2e3e"
          font {
            family: "JetBrains Mono"
            weight: Font.Black
            pixelSize: 12
          }

          y: ( parent.height - height - root.borderHeight )/2
          x: ( parent.width - width )/2
        }

        Rectangle {
          anchors.bottom: parent.bottom

          implicitHeight: root.borderHeight
          implicitWidth:  parent.width
          color: parent.isFocused ? "#bfc6d4" : "#2f2e3e"
        }
      }
    }
  }
}

