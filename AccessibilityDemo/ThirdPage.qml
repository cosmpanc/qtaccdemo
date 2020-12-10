import QtQuick 2.7
import QtQuick.Controls 2.12
import QtQuick.Window 2.12

Item {
    id: root
    width: parent.width
    height: parent.height

    Header {
        id: header
        text: "You're all set"
    }

    Component.onCompleted: {
        header.forceActiveFocus();
    }

    Text {
        id: subHeader

        Accessible.role: Accessible.StaticText
        Accessible.name: text

        anchors.top: header.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.right: parent.right
        anchors.rightMargin: 30

        text: "You can now use all the features of this application."

        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
        color: "#222222"
    }

    Rectangle {
        id: allSetImage

        anchors.top: subHeader.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.right: parent.right
        anchors.rightMargin: 30

        height: 200

        border.color: "#AAAAAA"
        border.width: 1
        color: "#DDDDDD"

        Text {
            color: "white"
            text: "Done Image"
            font.pixelSize: 40
            anchors.centerIn: parent
        }
    }

    StandardButton {
        text: "Finish"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        anchors.right: parent.right
        anchors.rightMargin: 30

        onClicked: {
            Window.window.close();
        }
    }
}
