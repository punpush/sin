import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtCharts 2.3
import QtQuick.Layouts 1.12
import DataFromWork 1.0

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("sinus")


    Connections {
        target: data
        onPointChanged: {
            line1.append(data.point.x, data.point.y)
        }
        onMaxrangeChanged: {
            axisX1.max = data.maxrange()
        }
    }

    DataFromWork {
        id: data
    }



    ColumnLayout {
        id: column

        anchors.fill: parent
        anchors.margins: 10


    ChartView {
        id: sinus

        antialiasing: true

        Layout.fillHeight: true
        Layout.fillWidth: true

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



    RowLayout {

        anchors.margins: 5
        spacing:50


        Button {
            id:start

        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter

        text: qsTr("Start")

        onClicked: data.start()

    }



    Slider {
        id:slider

        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter

        from: 1
        stepSize: 1
        to:100


        onMoved: speedchng(value)

        function speedchng(value){
            data.speed(slider.to - value)
            data.start()
        }

        Text {

            id:speed


            anchors.bottom: parent.top
            anchors.horizontalCenter: parent.horizontalCenter



            text: "speed"

        }
    }

    Button {
        id:stop

        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter

        text: qsTr("Stop")

        onClicked: data.stop()


    }

    }

}

}


