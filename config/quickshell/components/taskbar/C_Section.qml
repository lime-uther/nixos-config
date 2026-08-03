pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

Rectangle {
  id: root

  Layout.fillWidth: true
  Layout.fillHeight: true
  Layout.preferredWidth: 1
  color: "transparent"

  required property int borderHeight

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

  function getTime() {
    return Qt.formatDateTime(new Date(), "hh:mm AP");
  }

  function getDate() { 

    const month = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ][Qt.formatDateTime(new Date(), "M") - 1];

    const day = Qt.formatDateTime(new Date(), "dd");

    return `${month} ${day}`;
  }

  Text {
    text: `${root.currentDate}  ${root.currentTime}`
    color: "#bfc6d4"
    font {
      family: "JetBrains Mono"
      weight: Font.Black
      pixelSize: 12
    }

    y: ( parent.height - height - root.borderHeight )/2
    x: ( parent.width - width )/2
  }
}

