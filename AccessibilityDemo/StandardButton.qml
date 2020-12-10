import QtQuick 2.12
import QtQuick.Controls 2.12

Button {
    id: root

    Accessible.onPressAction: onClicked()

    hoverEnabled: true
    Keys.onEnterPressed: onClicked()
    Keys.onReturnPressed: onClicked()

    contentItem: Text {
        text: root.text
        font.underline: root.activeFocus
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        topPadding: 5
        bottomPadding: 5
        leftPadding: 20
        rightPadding: 20
        color: "white"
    }

    background: Rectangle {
        height: root.height
        color: root.hovered ? "#AAAAFF" : "#6666FF"
    }
}
