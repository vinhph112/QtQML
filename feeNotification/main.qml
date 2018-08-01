import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Controls 1.1
import QtGraphicalEffects 1.0

Window  {
    id: window
    visible: true
    width: 960
    height: 480
    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.Window

    property bool theme: true
    property bool backgroundImg: false
    Rectangle {
        anchors.fill: parent
        radius: 5
        color: theme ? "#282C34" : "#FFFFFF"
        border.color: theme ? "#21252B" : "#DDDDDD"
        Image {
            source: "qrc:/background.png"
            anchors.fill: parent
            visible: backgroundImg
        }
        Rectangle {
            id: header
            height: 40
            radius: 5
            width: parent.width
            anchors.top: parent.top
            color: theme ? "#21252B" : "#DDDDDD"


            Image {
                id: logo
                source: "qrc:/logo_iris.png"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
                width: 30
                height: 30
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        backgroundImg  = !backgroundImg
                    }
                }
            }
            Item {
                width: parent.width - row_btHeader.width - logo.width
                height: parent.height
                anchors.left: logo.right
                Text {
                    id: lbFeeHeader
                    text: qsTr("Fee Notification")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    font.pixelSize: 20
                    color: theme ?  "#DDDDDD" : "#282C34"

                }
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.SizeAllCursor
                    property var clickPos: "1,1"

                    onPressed: {
                        clickPos  = Qt.point(mouse.x,mouse.y)
                    }

                    onPositionChanged: {
                        var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                        window.x += delta.x;
                        window.y += delta.y;
                    }
                }
            }
            Row {
                id: row_btHeader
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 5
                spacing: 10
                VIconButton {
                    iconSource: theme ? "qrc:/images/theme_white.png" : "qrc:/images/theme_black.png"
                    dp: 0.75
                    onClicked: {
                        theme = !theme
                    }
                }
                VIconButton {
                    iconSource: theme ? "qrc:/images/min_white.png" : "qrc:/images/min_black.png"
                    dp: 0.5
                    onClicked: {
                        window.showMinimized()
                    }
                }
                VIconButton {
                    iconSource: theme ? "qrc:/images/close_white.png" : "qrc:/images/close_black.png"
                    dp: 0.5
                    onClicked: {
                        window.close()
                    }
                }
            }
        }
        Item {
            id: content
            width: parent.width
            height: parent.height - header.height - 20
            anchors.top: header.bottom
            anchors.topMargin: 10

            Item {
                height: parent.height

                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: react_btFunction.left
                anchors.rightMargin: 10
                Rectangle {
                    anchors.fill: parent
                    radius: 5
                    color: theme ? "#21252B" : "#CCCCCC"
                    opacity: 0.5
                }
                Column {
                    spacing: 10
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    width: parent.width - 40
                    Row {
                        spacing: 10
                        width: parent.width

                        Text {
                            text: "To"
                            color: theme ?  "#DDDDDD" : "#282C34"
                            font.pixelSize: 15
                            anchors.verticalCenter:  inputMailTo.verticalCenter
                            width: 80
                        }
                        VTextField {
                            id: inputMailTo
                            hint: "mail@mail.com"
                            width: parent.width - 90
                            backgroundColor: theme ? "#282C34" : "white"
                            color: theme ?  "#DDDDDD" : "#282C34"

                        }
                    }
                    Row {
                        spacing: 10
                        width: parent.width
                        Text {
                            text: "Title"
                            color: theme ?  "#DDDDDD" : "#282C34"
                            font.pixelSize: 15
                            anchors.verticalCenter:  inputTitle.verticalCenter
                            width: 80

                        }
                        VTextField {
                            id: inputTitle
                            hint: "tilte"
                            width: parent.width - 90
                            backgroundColor: theme ? "#282C34" : "white"
                            color: theme ?  "#DDDDDD" : "#282C34"
                        }
                    }
                    Row {
                        spacing: 10
                        width: parent.width
                        Text {
                            text: "Attachment"
                            color: theme ?  "#DDDDDD" : "#282C34"
                            font.pixelSize: 15
                            anchors.verticalCenter:  inputAttachment.verticalCenter
                            width: 80

                        }
                        Rectangle {
                            id: inputAttachment
                            width: parent.width - 180
                            radius: 4
                            height: 35
                            color: theme ? "#282C34" : "white"
                        }
                        VButtonMaterial {
                            id: btBrowse
                            anchors.verticalCenter:  inputAttachment.verticalCenter
                            width: 80
                            height: 32
                            radius: 5
                            bodyFontSize: 13
                            text: "Browse"
                            color: theme ? "#CCCCCC" : "white"
                            textColor: "black"
                            visbleBorder: false
                        }
                    }
                    Text {
                        text: "Content"
                        color: theme ?  "#DDDDDD" : "#282C34"
                        font.pixelSize: 15
                        width: 40
                    }
                    Rectangle {
                        color: theme ? "#282C34" : "#FFFFFF"
                        width: parent.width
                        height: parent.height * 0.58
                        radius: 5
                        TextEdit {
                            id: inputContent
                            anchors.top: parent.top
                            anchors.topMargin: 10
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 10
                            wrapMode: Text.Wrap
                            font.pixelSize: 15
                            color: theme ? "#FFFFFF" : "#21252B"
                            selectByMouse: true
                            //selectedTextColor: "gray"
                            selectionColor: theme ? "#DDDDDD" : "#21252B"
                            text: "Trong bản iOS 12 Beta mới, người ta phát hiện rằng nó sẽ hỗ trợ giao diện xoay ngang cho một thiết bị có độ phân giải màn hình 1242 x 2688. Có khả năng đây chính là chiếc iPhone X Plus, và hiện tại dòng iPhone 8 Plus cũng xoay ngang màn hình để bung thành giao diện gần giống iPad trong khi iPhone X khi xoay ngang thì không làm được như thế. Trước mắt có thể khẳng định rằng các app hệ thống như Calendar, Contacts, Messages sẽ tương thích với chế độ xoay màn hình dành cho iPhone X Plus, các app bên thứ ba nếu có hỗ trợ cho iPhone Plus thì cũng sẽ chạy được theo cách tương tự.

Cũng trong iOS 12 Beta, có những dòng chữ cho thấy iPhone X Plus hoặc iPhone 6,1 LCD mới sẽ hỗ trợ 2 SIM. Thậm chí hệ điều hành còn nhắc cụ thể tới khe SIM thứ hai nữa kìa. Chắc nhiều anh em thích iPhone mà cần dùng 2 SIM sẽ thích lắm."
                        }
                    }
                }
            }
            Rectangle {
                id: react_btFunction
                width: parent.width * 0.2
                height: parent.height
                radius: 5
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
                color: "transparent"

                VButtonMaterial {
                    id: btLogin
                    width: parent.width - 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    height: 40
                    radius: 5
                    bodyFontSize: 15
                    text: "SEND"
                    color: "#CCCCCC"
                    textColor: "black" /*theme ? "#282C34" : "#FFFFFF"*/
                    visbleBorder: false
                }
            }
        }
    }
}
