import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

Scope {
  id: root

  function getTime() {
    return Qt.formatDateTime(new Date(), "hh:mm AP");
  }

  function getDate() { 

    const month = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ][Qt.formatDateTime(new Date(), "M")];

    const day = Qt.formatDateTime(new Date(), "dd");

    return `${month} ${day}`;
  }

  property string currentDate: getDate()
  property string currentTime: getTime()


  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
      root.currentTime = root.getTime()
    }
  }

  Timer {
    interval: 60000
    running: true
    repeat: true
    onTriggered: {
      root.currentDate = root.getDate()
    }
  }

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

      color: "#1d2021"

      RowLayout {
        anchors.fill: parent

        Rectangle {
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.preferredWidth: 1
          color: "transparent"
        }

        Rectangle {
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.preferredWidth: 1
          color: "transparent"

          Text {
            anchors.centerIn: parent
            text: `${root.currentDate}  ${root.currentTime}`
            color: "#d5c4a1"
            font {
              family: "JetBrains Mono"
              weight: Font.Medium
              pixelSize: 12
            }
          }
        }

        Rectangle {
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.preferredWidth: 1
          color: "transparent"
        }

      }
    }
  }
}
