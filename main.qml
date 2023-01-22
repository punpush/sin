import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtCharts 2.3
import QtQuick.Layouts 1.12

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("sinus")


    GridLayout {
        id: grid

        anchors.fill: parent
        anchors.margins: 10
        rows: 10
        columns: 3



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

        antialiasing: true

        Layout.column: 0
        Layout.row: 1
        Layout.rowSpan: 6
        Layout.columnSpan: 3


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




    Button {
        id:start

        Layout.column: 0
        Layout.row: 10
        Layout.minimumHeight: 40
        Layout.minimumWidth: 100

        text: qsTr("Start")

        onClicked: DataFromWork.start()

    }





    Button {
        id:stop

        Layout.column: 2
        Layout.row: 10
        Layout.minimumHeight: 40
        Layout.minimumWidth: 100
        Layout.columnSpan: 1
        Layout.alignment: Qt.AlignRight

        text: qsTr("Stop")

        onClicked: DataFromWork.stop()


    }


    Slider {
        id:slider

        Layout.column: 1
        Layout.row: 10
        Layout.minimumHeight: 40
        Layout.minimumWidth: 200
        Layout.alignment: Qt.AlignHCenter

        from: 1
        stepSize: 10
        to:100


        onMoved: speedchng(value)

        function speedchng(value){
            DataFromWork.speed(value)
            DataFromWork.start()
        }
    }






    Text {
        id:speed

        Layout.column: 1
        Layout.row: 9
        Layout.minimumHeight: 10
        Layout.minimumWidth: 10
        Layout.alignment: Qt.AlignHCenter
        text: "speed"

    }

}

}





