import QtQuick 2.15

Item {
    id: itemTextAnimID
    width: widthText
    height: heightText
    x: xText
    y: yText
    property int widthText: 0
    property int heightText: 0
    property int xText: 0
    property int yText: 0
    property string contentTextAnim: ""
    property bool animationRun: false
    property var idTextShow : textShowID
    property var idTextShow1 : textShowID1

    property int widthTextShow: textShowID.width
    property int widthBackgroundTextShow: bgTextShowID.width

    property real temporaryWidth: 0

    Rectangle {
        id: bgTextShowID
        anchors.fill: parent

        color: "lightcyan"
        border.color: "orange"

        clip: true

        Text {
            visible: true
            id: textShowID
            height: parent.height
            text: contentTextAnim
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            visible: false
            id: textShowID1
            height: parent.height
            text: contentTextAnim
            verticalAlignment: Text.AlignVCenter
        }


        NumberAnimation {
            id: textAnimation
            target: textShowID1
            property: "x"
            from: bgTextShowID.width                // chạy từ cạnh biên bên phải của recShowID
            to: -1 * textShowID1.width               // đến khi ký tự cuối cùng qua cạnh biên bên trái recShowID
            duration: 5000                          // Thời gian di chuyển
            loops: Animation.Infinite

            running: animationRun

            onRunningChanged: {
                // khi isFocus = false => textAnimation.running = false
                if (!animationRun) {
                    textShowID1.x = 0;               // đặt lại ví trí x của text hiển thị trên recShowID
                }
                else console.log(contentTextAnim)
            }
        }
    }

    Text {
        visible: false
        text: contentTextAnim

        onTextChanged: {
            // Lấy giá trị chiều rộng của văn bản phần text này ẩn để lưu chiều dài của textInputID
            temporaryWidth= contentWidth;
            console.log("===================>Text width: " + temporaryWidth);
        }

    }
}
