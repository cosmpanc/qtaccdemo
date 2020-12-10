import QtQuick 2.12
import QtQuick.Window 2.12

Item {
    visible: true
    width: 640
    height: 480

    Loader {
        id: loader
        anchors.fill: parent
        visible: (status === Loader.Ready)
        source: currentPageUrl

        focus: true
        asynchronous: true

        property int currentIndex : 0
        property string currentPageUrl : "qrc:/FirstPage.qml"

        property var pages : ["qrc:/FirstPage.qml", "qrc:/SecondPage.qml", "qrc:/ThirdPage.qml"];
        function nextPage() {
             if (currentIndex < pages.length - 1) {
                 currentIndex++;
                 currentPageUrl = pages[currentIndex];
             }
        }

        function previousPage() {
            if (currentIndex > 0) {
                currentIndex--;
                currentPageUrl = pages[currentIndex];
            }
        }
    }
}

