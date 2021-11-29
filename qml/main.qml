import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "controls"

Window {
    id: window
    width: 150
    height: 200
    visible: true
    color: "#212121"
    title: qsTr("Burak Ekiz")
    flags: Qt.Window | Qt.FramelessWindowHint
    DragHandler{
           onActiveChanged: if(active){
                                window.startSystemMove()
                            }
    }
    SpinBox {
        id: dakikaSelectBox
        from:0
        to:59
        height: 22
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 128
        anchors.rightMargin: 15
        anchors.leftMargin: 15
        anchors.verticalCenterOffset: 39
    }

        SpinBox {
            id: saatSelectBox
            x: 15
            width: 120
            height: 22
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 68
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            from: 0
            to: 23

        }

        Label {
            id: label
            height: 26
            color: "#ffffff"
            text: qsTr("Saat")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 36
            anchors.rightMargin: 15
            anchors.leftMargin: 15
            font.pointSize: 16
        }

        Label {
            id: label1
            height: 26
            color: "#ffffff"
            text: qsTr("Dakika")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            anchors.topMargin: 96
            font.pointSize: 16
        }
        ToggleBtn
        {
            id: toggleBtn
            width: 150
            height: 35
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            btnColorClicked: "#c21807"
            anchors.topMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            btnColorDefault: "#ed2939"
            Label
            {
                x: 20
                y: 11
                width: 55
                height: 26
                text:"Kapat"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 16
                color:"#ffffff"
            }
            onClicked: window.close()
        }
        StartButton
        {
            height: 26
            Label
            {
                text:"Başlat"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 16
                color:"#ffffff"
            }
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 163
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            onClicked: backend.baslat(saatSelectBox.value, dakikaSelectBox.value)
        }
        Connections
            {
                target: backend
                function onHide(string)
                {
                   window.hide()
                }
            }
}


