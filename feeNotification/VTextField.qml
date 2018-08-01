import QtQuick 2.0
import "."

Rectangle {
    id: control
    implicitWidth: input.contentWidth
    implicitHeight: Math.max(input.contentHeight + 20, 30)
    radius: 4
    property color focusColor: "#2979FF"

    property alias text: input.text
    property alias hint: placeholder.text
    property alias length: input.length
    property alias maxLength: input.maximumLength

    property alias echoMode: input.echoMode
    property alias inputMethod: input.inputMethodHints
    property alias color: input.color
    property alias font: input.font
    property alias tabInput: input
    property alias rightInput: input
    property alias leftInput: input


    property alias validator: input.validator
    property bool cursorVisible: false
    property real subheadFontSize: 12

    property alias backgroundColor: control.color
    signal enterKey()
    signal clicked_input()

    color: "transparent"

    border.color: input.focus ? control.focusColor : "#BDBDBD"
    Behavior on color {
        ColorAnimation { duration: 200 }
    }
    Text {
        id: placeholder
        anchors.fill: input
        visible: !input.length && !input.inputMethodComposing
        color: "#757575"
        font: input.font
    }

    //    MouseArea {
    //       anchors.fill: parent
    //       propagateComposedEvents: true
    //       onClicked: {
    //         console.log("clicked on TextInput");
    //         //mouse.accepted = false;
    //       }
    //     }
    TextInput {
        id: input
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            right: parent.right
            leftMargin: 10
        }
        color: "#de000000"
        selectionColor: "#91a7ff"
        selectedTextColor: color
        font.family: "Roboto"
        font.pixelSize: subheadFontSize
        cursorVisible: cursorVisible
        //font.bold: true
        //focus: control.focus
        clip: true
        wrapMode: TextInput.WordWrap
        onAccepted: {
            enterKey()
        }


        activeFocusOnPress: false

        MouseArea {
            anchors.fill: parent
            onClicked: {
                input.forceActiveFocus(/*Qt.MouseFocusReason*/);
                //console.log("aaaaaaaaaaaaaaaaaaaaaaaaaaaa")
                clicked_input()
                Qt.inputMethod.show();
            }
        }
    }
    onCursorVisibleChanged: {
        input.cursorVisible = cursorVisible;
        input.focus = cursorVisible
    }
}
