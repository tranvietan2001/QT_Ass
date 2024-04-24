import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Curve List")

    Rectangle{
        width: 100
        height: 50

        Text {
            anchors.centerIn: parent
            text: qsTr("Nhập R: ")
        }
    }


    Rectangle{
        width: 100
        height: 50
        x: 100

        TextField{
            id: inputRID
            anchors.fill: parent
        }
    }

    Rectangle{
        width: 50
        height: 50
        x: 250
        color: "green"
        radius: 25

        Text {
            anchors.centerIn: parent
            text: qsTr("Enter")
        }
    }


    Rectangle{
        y: 200
        width: 500
        height: 500


    }
}
