import QtQuick 2.0

Rectangle {
    id: root
    property string text: "Title"

    Accessible.role: Accessible.StaticText
    Accessible.name: title.text
    Accessible.focusable: true

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    anchors.topMargin: 40
    height: title.implicitHeight
    width: parent.width - 200

    Text {
        id: title
        font.pixelSize: 32
        text: root.text
        color: "#333333"
        width: root.width
        anchors.horizontalCenter: parent.horizontalCenter
        z:2
        horizontalAlignment: Text.AlignHCenter
    }
}
