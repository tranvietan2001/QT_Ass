import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "Component"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Text Animation")

    property bool isFocus: false
    property string contentText: ""
    property bool lenghtTextStt : false  // false: text ngắn, true: text dài


    Rectangle{
        width: 70
        height: 50
        Text {
            anchors.centerIn: parent
            leftPadding: 20
            text: qsTr("Nhập Text: ")
        }
    }

    TextField{
        id: textInputID
        width: 300
        height: 50
        x: 100
    }


    Rectangle{
        id: setFocusID
        width: 100
        height: 50;
        color: isFocus ? "green" : "gray"
        x: 420

        Text {
            id: contentID
            text: "Focus: " + isFocus
            color: "white"
            anchors.centerIn: parent
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                isFocus= !isFocus
            }
        }

    }

    Rectangle{
        id: enterTextID
        width: 50
        height: 50
        x: 550
        radius: 25
        color: "orange"
        Text {
            text: "Enter"
            anchors.centerIn: parent
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true

            onClicked: {
                console.log("Enter-Click")
                contentText = textInputID.text
                console.log(contentText)

                console.log(textAnimID.idTextShow)

                // console.log("textAnimID.temporaryWidth: " + textAnimID.temporaryWidth)
                // console.log("textAnimID.withBackgroundTextShow:  " + textAnimID.widthBackgroundTextShow)

                if(textAnimID.temporaryWidth >= textAnimID.widthBackgroundTextShow){
                    lenghtTextStt = true
                    console.log("Văn bản dài")
                }else {
                    lenghtTextStt = false
                    console.log("Văn bản ngắn")
                }

                if(isFocus == true && lenghtTextStt == true){
                    console.log("Animation chạy đày đủ chữ từ phải qua trái")
                    textAnimID.idTextShow.elide = Text.ElideNone
                    textAnimID.animationRun = true

                    textAnimID.idTextShow.visible = false
                    textAnimID.idTextShow1.visible = true
                }

                else if(isFocus == false && lenghtTextStt == true){

                    textAnimID.animationRun = false
                    textAnimID.idTextShow.clip = true
                    textAnimID.idTextShow.width = textAnimID.widthBackgroundTextShow // giới hạn chiều dài

                    textAnimID.idTextShow.elide = Text.ElideRight   // 3 chấm khi text dài hơn rectangle

                    textAnimID.idTextShow.visible = true
                    textAnimID.idTextShow1.visible = false

                    console.log("3 chấm")

                }
                else if(lenghtTextStt == false){
                    console.log("đứng yên")
                    textAnimID.animationRun = false
                    textAnimID.idTextShow.elide = Text.ElideNone

                    textAnimID.idTextShow.visible = false
                    textAnimID.idTextShow1.visible = true
                }
            }

            onEntered: {
                enterTextID.color = "orangered"
            }

            onExited: {
                enterTextID.color = "orange"
            }

        }
    }




    //========================================================
    Rectangle{
        width: 70
        height: 50
        y: 80
        Text {
            anchors.centerIn: parent
            leftPadding: 20
            text: qsTr("Text Anim ")
        }
    }

    TextAnim{
        id: textAnimID
        widthText: 300
        heightText: 50
        xText: 100
        yText: 80
        contentTextAnim: contentText
    }
}

