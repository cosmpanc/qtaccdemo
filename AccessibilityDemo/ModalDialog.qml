import QtQuick 2.7
import QtQuick.Controls 2.12

Dialog {
    id: root
    width: 450
    height: 300
    anchors.centerIn: parent

    property string headerText : "Header"
    property string bodyText : "Contents go here"
    property string acceptButtonText : "Accept"
    property string rejectButtonText : "Reject"

    onOpened: {
        theHeader.forceActiveFocus()
    }

    header: Text {
        id: theHeader
        font.pixelSize: 20
        text: headerText

        leftPadding: 30
        rightPadding: 30
        topPadding: 40
        bottomPadding: 40

        Accessible.role: Accessible.StaticText
        Accessible.name: text
        Accessible.focusable: true
    }

    contentItem: Rectangle {
        id: content

        Text {
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere

            id: contentTextElement
            text: bodyText
            width: theHeader.width
            leftPadding: 25
            rightPadding: 25
            font.pixelSize: 14

            Accessible.role: Accessible.StaticText
            Accessible.name: text
        }
    }

    footer: Row {
        anchors.right: parent.right
        width: childrenRect.width

        topPadding: 20
        bottomPadding: 20
        leftPadding: 25
        rightPadding: 25

        spacing: 12

        layoutDirection : Qt.RightToLeft

        StandardButton {
            focus: true
            text: acceptButtonText
            onClicked: root.accept();
        }

        StandardButton {
            text: rejectButtonText
            onClicked: root.reject()
        }
    }
}
