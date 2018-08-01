import QtQuick 2.0

Item {
    id: button

    width: 32
    height: 32

    property alias rippleColor: ripple.color
    property alias iconSource: icon.source
    property alias cursorShape: mouseArea.cursorShape

    property real dp: 1


    signal clicked

    states: State {
        name: "mouse-over"; when: mouseArea.containsMouse
        PropertyChanges { target: button; scale: 1.125; opacity: 1;}
    }
    VPaperRipple {
        id: ripple
        anchors {
            fill: undefined
            centerIn: parent
        }
        width: 40 * dp
        height: 40 * dp
        radius: 20 * dp
        mouseArea: mouseArea
    }

    Image {
        id: icon
        anchors.centerIn: parent
        width: 24 * dp
        height: 24 * dp
        sourceSize.width: width
        sourceSize.height: height
        opacity: button.enabled ? 1 : 0.62

        Behavior on opacity {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Bezier; easing.bezierCurve: [0.4, 0, 0.2, 1, 1, 1]
            }
        }
    }
    MouseArea {
        id: mouseArea
        anchors.fill: ripple
        hoverEnabled: true
        enabled: button.enabled
        cursorShape: Qt.PointingHandCursor
        onClicked: button.clicked()
    }

}

