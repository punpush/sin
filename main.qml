import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtCharts 2.3

Window {
    id: window1
    width: 1280
    height: 1024
    visible: true
    title: qsTr("sinus")

    Button {
        id:start


        anchors.margins: 30
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        text: qsTr("Start")

    }

    Button {
        id:stop

        anchors.margins: 30
        anchors.bottom: parent.bottom
        anchors.right: parent.right

        text: qsTr("Stop")

    }

    Slider {
        id:slider

        anchors.margins: 30
        anchors.horizontalCenter : parent.horizontalCenter
        anchors.bottom: parent.bottom
    }

    Text {
        id:speed

        text: "Speed"


        anchors.margins: 20
        anchors.horizontalCenter : parent.horizontalCenter
        anchors.bottom: parent.bottom

    }

    ChartView {

        id:graph

        anchors.margins: 100
        anchors.horizontalCenter : parent.horizontalCenter
        anchors.top: parent.top
        antialiasing: true

        width: 1000

        height: 800

        LineSeries {
            name: "sinus"

        }
    }


}



