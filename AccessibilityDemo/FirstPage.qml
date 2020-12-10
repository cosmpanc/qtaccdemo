import QtQuick 2.7
import QtQuick.Controls 2.12

Item {
    id: root
    width: parent.width
    height: parent.height

    Header {
        id: header
        text: "Welcome to the Talk"
        focus: true
    }

    // Optional, announce the text instead of relying
    // on initial forceActiveFocus
    onVisibleChanged: {
        if (visible) {
            appModel.announceText(header, header.text);
        }
    }

    Rectangle {
        id: welcomeImage

        Accessible.role: Accessible.Graphic
        Accessible.name: "Welcome logo"

        border.color: "#AAAAAA"
        border.width: 1
        anchors.top: header.bottom
        anchors.topMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.right: parent.right
        anchors.rightMargin: 30
        color: "#DDDDDD"

        height: 200

        Text {
            color: "white"
            text: "Logo"
            font.pixelSize: 40
            anchors.centerIn: parent
        }
    }

    Text {
        id: infoText

        Accessible.role: Accessible.StaticText

        // Lazy workaround for the bug that Accessible.name needs all the HTML tags stripped
        // otherwise they get read out by Screen Readers
        Accessible.name: "This setup will guide you through installing the application and creating your account. By clicking \"Start\" you agree to our Terms of Service and Privacy Agreement"

        anchors.top: welcomeImage.bottom
        anchors.topMargin: 10
        anchors.left: welcomeImage.left
        anchors.right: welcomeImage.right

        font.pixelSize: 14

        text: "This setup will guide you through installing the <a href='https://qt.io'>application</a> and creating your account. By clicking \"Start\" you agree to our <a href='#'>Terms of Service</a> and <a href='#'>Privacy Agreement</a>"
        wrapMode: Text.WordWrap

        MouseArea {
            anchors.fill: parent
            cursorShape: (infoText.hoveredLink !== "") ? Qt.PointingHandCursor : Qt.ArrowCursor
        }

        visible: true
    }

    StandardButton {
        text: "Start"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        anchors.right: parent.right
        anchors.rightMargin: 30

        onClicked: {
            loader.nextPage()
        }
    }
}
