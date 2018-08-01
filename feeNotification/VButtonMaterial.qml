import QtQuick 2.0
import "."

Item {
    id: button
    width: Math.max(88 /** dp*/, label.paintedWidth + 32 /** dp*/)
    height: 36 /** dp*/

    property alias text: label.text
    property color color: "white"
    property alias textColor: label.color
    property alias rippleColor: ripple.color
    property alias radius: background.radius

    readonly property color displayTextColor: "#8a000000"
    readonly property color bodyTextColor: "#de000000"
    property real bodyFontSize: 13

    property bool visbleBorder: true

    signal clicked

    Rectangle {
        id: background
        anchors.fill: parent
        radius: 2 /** dp*/
        color: button.enabled ? button.color : "#eaeaea"
        //visible: false
        border.color: visbleBorder ? textColor : "transparent"
    }

    Text {
        id: label
        anchors.centerIn: parent
        //font.family: "Arial"
        font.family: "Roboto"
        font.pixelSize: bodyFontSize
        //font.bold: Font.DemiBold
        //font.capitalization: Font.AllUppercase
        color: button.enabled ? bodyTextColor : displayTextColor
        opacity: button.enabled ? 1 : 0.62

        Behavior on opacity {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Bezier; easing.bezierCurve: [0.4, 0, 0.2, 1, 1, 1]
            }
        }
    }

    VPaperRipple {
        id: ripple
        radius: 3 /** dp*/
        mouseArea: mouseArea
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: button.enabled
        cursorShape: Qt.PointingHandCursor
        onClicked: button.clicked()
    }
}
