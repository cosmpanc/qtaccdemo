import QtQuick 2.7
import QtQuick.Controls 2.12

Item {
    id: root
    width: parent.width
    height: parent.height

    Header {
        id: header
        Accessible.ignored: confirmDialog.opened
        text: "Choose your install options"
    }

    Component.onCompleted: {
        header.forceActiveFocus();
    }

    Rectangle {
        id: dimmer
        color: "black"
        opacity: 0.4
        visible: confirmDialog.opened
        anchors.fill: parent
        z: 2
    }

    property bool showWarning : (checkbox3.checkState !== Qt.Checked)

    Rectangle {
        id: welcomeImage

        border.color: "#DDDDDD"
        border.width: 1

        anchors.top: header.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        width: 400

        height: 250

        Column {
            CheckBox {
                id: checkbox1
                Accessible.ignored: confirmDialog.opened
                text: "Install application"
                checkState: Qt.Checked
            }

            CheckBox {
                id: checkbox2
                Accessible.ignored: confirmDialog.opened
                text: "Copy my files"
                checkState: Qt.Checked
            }

            CheckBox {
                id: checkbox3
                Accessible.ignored: confirmDialog.opened
                text: "Setup account"
                checkState: Qt.Unchecked
            }
        }
    }

    ModalDialog {
        id: confirmDialog
        acceptButtonText: "Continue"
        rejectButtonText: "No thanks"
        headerText: "Install without setting up an account?"
        bodyText: "An account is required to use all the features of the application. Without one, the application will run in offline mode."

        focus: true

        onAccepted: loader.nextPage()
        onRejected: nextButton.forceActiveFocus()
    }

    StandardButton {
        id: backButton

        Accessible.ignored: confirmDialog.opened

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        anchors.right: nextButton.left
        anchors.rightMargin: 10

        text: "Back"
        onClicked: loader.previousPage()
    }

    StandardButton {
        id: nextButton

        Accessible.ignored: confirmDialog.opened

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        anchors.right: parent.right
        anchors.rightMargin: 30

        text: "Next"
        onClicked: {
            if (root.showWarning) {
                confirmDialog.open();
            }
            else {
                loader.nextPage();
            }
        }
    }
}
