import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    minimumHeight: 512
    minimumWidth: 1124
    maximumHeight: 512
    maximumWidth: 1124
    title: qsTr("Demo SlideShow")

    VSlide {
        anchors.fill: parent
    }
}
