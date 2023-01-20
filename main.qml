import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtCharts 2.3


Window {
    width: 1280
    height: 1024
    visible: true
    title: qsTr("sinus")


    Connections {
        target: DataFromWork
        onPointChanged: {
            line1.append(DataFromWork.point.x, DataFromWork.point.y)
        }
        onMaxrangeChanged: {
            axisX1.max = DataFromWork.maxrange()
        }
    }

    ChartView {
        id: sinus
        anchors.margins: 100
        anchors.horizontalCenter : parent.horizontalCenter
        anchors.top: parent.top
        antialiasing: true

        width: 1000

        height: 800

        ValueAxis {
            id: axisY
            min: -1
            max: 1
        }
        ValueAxis {
            id: axisX1
            min: 0
            max: 50
        }
        LineSeries {
            id: line1
            axisX: axisX1
            axisY: axisY
        }

    }

    Button {
        id:start


        anchors.margins: 30
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        text: qsTr("Start")

        onClicked: DataFromWork.start()

    }

    Button {
        id:stop

        anchors.margins: 30
        anchors.bottom: parent.bottom
        anchors.right: parent.right

        text: qsTr("Stop")

        onClicked: DataFromWork.stop()


    }

    Slider {
        id:slider

        anchors.margins: 30
        anchors.horizontalCenter : parent.horizontalCenter
        anchors.bottom: parent.bottom

        from: 1
        stepSize: 10
        to:100


        onMoved: speedchng(value)



    }

    Text {
        id:speed

        text: "speed"


        anchors.margins: 60
        anchors.horizontalCenter : parent.horizontalCenter
        anchors.bottom: parent.bottom

    }

    function speedchng(value){
        DataFromWork.speed(value)
        DataFromWork.start()
    }




}



