import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

ApplicationWindow {
    id:window
    width: 1160
    height: 600
    visible: true
    title: qsTr("HMI-523 Project")

    property int aNumber: 1

    property bool authorized: false

    Connections{
        target: mainFunc
        function onLow(accu) {
            status_img.source="assets/safe.png"
            status_txt.text=qsTr("Low Risk")
            status_txt.color="#20BF55"
            accu_result_txt.text=qsTr(accu)
        }
        function onHigh(accu) {
            status_img.source="assets/warning.png"
            status_txt.text=qsTr("High Risk")
            status_txt.color="#DD636E"
            accu_result_txt.text=qsTr(accu)
        }

    }


    RowLayout{
        id:row
        anchors.fill:parent
        spacing: 0

        Rectangle{
            id:learn
            implicitHeight: parent.height
            width: 200
            color: "#B1D0E0"

            ColumnLayout{
                anchors.fill: parent
                spacing: 2

                Text {
                    id: learning_methods
                    text: qsTr("Learning Methods")
                    font.bold: true
                    font.pointSize: 12
                    font.family: "Segoe UI"
                    color: "#1A374D"
                    topPadding: 20
                    leftPadding: 24
                    anchors.top: parent.top
                }


                Rectangle{
                    id:line
                    width: 160
                    height: 3
                    color: "#1A374D"
                    anchors.top:learning_methods.bottom
                    anchors.topMargin: 6
                    anchors.horizontalCenter: parent.horizontalCenter

                }

                Button{
                    id:knn
                    implicitWidth: parent.width
                    implicitHeight: 80
                    anchors.top:line.bottom
                    onClicked: {
                        mainFunc.knnClicked()
                        knn_back.color="#6998AB"
                        random_forest_back.color="#B1D0E0"
                        knn_txt.color="#1A374D"
                        random_forest_txt.color="#406882"
                        random_forest_column.visible=false
                        knn_column.visible=true
                        aNumber= 1
                        secenek.width=200
                    }
                    background: Rectangle{
                        id:knn_back
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        color: "#6998AB"
                        objectName: "knn_back"

                        Item{
                           id:rounded_border_knn
                           implicitWidth: parent.width
                           implicitHeight: parent.height

                           Rectangle{
                               height: 16
                               width: 192
                               anchors.top: parent.top
                               anchors.left: parent.left
                               color: "#B1D0E0"
                           }

                           Rectangle{
                               height: 16
                               width: 192
                               anchors.bottom: parent.bottom
                               anchors.left: parent.left
                               color: "#B1D0E0"
                           }

                           Rectangle{
                               height: 16
                               width: 16
                               anchors.bottom: parent.bottom
                               anchors.right: parent.right
                               radius: 30
                               color: "#B1D0E0"
                           }

                           Rectangle{
                               height: 16
                               width: 16
                               anchors.bottom: parent.bottom
                               anchors.right: parent.right
                               anchors.rightMargin: 8
                               color: "#B1D0E0"
                           }

                           Rectangle{
                               height: 8
                               width: 8
                               anchors.bottom: parent.bottom
                               anchors.right: parent.right
                               color: "#B1D0E0"
                           }

                           Rectangle{
                               height: 16
                               width: 16
                               anchors.top: parent.top
                               anchors.right: parent.right
                               radius: 30
                               color: "#B1D0E0"
                           }

                           Rectangle{
                               height: 16
                               width: 16
                               anchors.top: parent.top
                               anchors.right: parent.right
                               anchors.rightMargin: 8
                               color: "#B1D0E0"
                           }

                           Rectangle{
                               height: 8
                               width: 8
                               anchors.top: parent.top
                               anchors.right: parent.right
                               color: "#B1D0E0"
                           }
                        }

                        Text {
                            id: knn_txt
                            text: qsTr("KNN")
                            font.bold: true
                            font.pointSize: 12
                            font.family: "Segoe UI"
                            color: "#1A374D"
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 24

                        }

                    }
                }

                Button{
                    visible: true
                    id:random_forest
                    implicitWidth: parent.width
                    implicitHeight: 80
                    anchors.top: knn.bottom
                    onClicked: {
                        mainFunc.randomforestClicked()
                        knn_back.color="#B1D0E0"
                        random_forest_back.color="#6998AB"
                        knn_txt.color="#406882"                      
                        random_forest_txt.color="#1A374D"
                        random_forest_column.visible=true
                        knn_column.visible=false
                        aNumber= 2
                        secenek.width=50
                    }
                    background:Rectangle{
                        id:random_forest_back
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        color: "#B1D0E0"


                        Item{
                           id:rounded_border_random_forest
                           implicitWidth: parent.width
                           implicitHeight: parent.height

                           Rectangle{
                               height: 16
                               width: 192
                               anchors.top: parent.top
                               anchors.left: parent.left
                               color: "#B1D0E0"
                           }

                           Rectangle{
                               height: 16
                               width: 192
                               anchors.bottom: parent.bottom
                               anchors.left: parent.left
                               color: "#B1D0E0"
                           }

                           Rectangle{
                               height: 16
                               width: 16
                               anchors.bottom: parent.bottom
                               anchors.right: parent.right
                               radius: 30
                               color: "#B1D0E0"
                           }

                           Rectangle{
                               height: 16
                               width: 16
                               anchors.bottom: parent.bottom
                               anchors.right: parent.right
                               anchors.rightMargin: 8
                               color: "#B1D0E0"
                           }

                           Rectangle{
                               height: 8
                               width: 8
                               anchors.bottom: parent.bottom
                               anchors.right: parent.right
                               color: "#B1D0E0"
                           }

                           Rectangle{
                               height: 16
                               width: 16
                               anchors.top: parent.top
                               anchors.right: parent.right
                               radius: 30
                               color: "#B1D0E0"
                           }

                           Rectangle{
                               height: 16
                               width: 16
                               anchors.top: parent.top
                               anchors.right: parent.right
                               anchors.rightMargin: 8
                               color: "#B1D0E0"
                           }

                           Rectangle{
                               height: 8
                               width: 8
                               anchors.top: parent.top
                               anchors.right: parent.right
                               color: "#B1D0E0"
                           }
                        }


                        Text {
                            id: random_forest_txt
                            text: qsTr("Random Forest")
                            font.bold: true
                            font.pointSize: 12
                            font.family: "Segoe UI"
                            color: "#406882"
                            leftPadding: 24
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }




            }




        }
        Rectangle{
            id:secenek
            implicitHeight: parent.height
            anchors.left: learn.right
            width: 200
            color: "#6998AB"

            ColumnLayout{
                id: knn_column
                anchors.fill: parent
                visible: true

                Text {
                    id:knn_k_value_txt
                    text: qsTr("K Value")
                    font.bold: true
                    font.pointSize: 12
                    font.family: "Segoe UI"
                    color: "#FFFFFF"
                    leftPadding: 20
                    topPadding: 60
                    anchors.top: parent.top
                }

                Slider {
                    id:knn_slider
                    from: 1
                    value: 16
                    to: 40
                    leftPadding: 20
                    rightPadding: 20
                    anchors.top: knn_k_value_txt.bottom
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    topPadding: 10
                    stepSize: 1.0
                    pressed: {
                        slider_num.text=knn_slider.value.toString()
                    }
                }

                Text {
                    id: slider_num
                    text: qsTr("16")

                    anchors.top: knn_slider.bottom
                    anchors.right: parent.right
                    font.bold: true
                    font.pointSize: 12
                    font.family: "Segoe UI"
                    color: "#FFFFFF"
                    rightPadding: 22
                }



            }

            ColumnLayout{
                id: random_forest_column
                visible: false
                anchors.fill: parent



            }


        }

        Rectangle{
            id:icerik
            implicitHeight: parent.height
            anchors.left: secenek.right
            anchors.right: row.right
            anchors.bottom: parent.bottom
            color: "white"


            ColumnLayout{
                anchors.fill: parent
                Layout.fillHeight: true
                Layout.fillWidth: true

                ColumnLayout{
                    Layout.leftMargin: 20
                    Layout.topMargin: 10
                        Text {
                            id:accu_txt
                            anchors.top:parent.top
                            topPadding: 10
                            leftPadding: 20
                            anchors.left: parent.left
                            text: qsTr("Accuracy")
                            font.bold: true
                            font.pointSize: 16
                            font.family: "Segoe UI"
                            color: "#1A374D"

                        }



                        Rectangle{
                            id:line3
                            width: 120
                            height: 3
                            color: "#1A374D"
                            anchors.top:result_txt.bottom
                            Layout.leftMargin: 20

                        }

                        Text {
                            id:accu_result_txt
                            anchors.top:line3.top
                            topPadding: 20
                            leftPadding: 40
                            anchors.left: parent.left
                            text: qsTr("--%")
                            font.bold: true
                            font.pointSize: 32
                            font.family: "Segoe UI"
                            color: "#1A374D"

                        }

                }



                RowLayout{
                    id:input_row
                    Layout.fillWidth: true
                    height: 300
                    anchors.bottom: bottom_space.top
                    Layout.leftMargin: 20


                    ColumnLayout{
                        implicitHeight: parent.height
                        width: 400


                        ColumnLayout {

                            Text {
                                text: qsTr("Age")
                                font.bold: true
                                font.pointSize: 10
                                font.family: "Segoe UI"
                                color: "#406882"
                            }

                            TextField{
                                id:age
                                anchors.leftMargin: 10
                                font.family: "Segoe UI"
                                font.pointSize: 12
                                height:30
                                width:100
                                background: Rectangle {
                                    implicitWidth: 100
                                    implicitHeight: 30
                                    radius: 8
                                    color: "#C8CDD1"
                                }
                            }

                        }

                        ColumnLayout {

                            Text {
                                text: qsTr("Gender")
                                font.bold: true
                                font.pointSize: 10
                                font.family: "Segoe UI"
                                color: "#406882"
                            }

                            TextField{
                                id: sex
                                anchors.leftMargin: 10
                                font.family: "Segoe UI"
                                font.pointSize: 12
                                height:30
                                width:100
                                background: Rectangle {
                                    implicitWidth: 100
                                    implicitHeight: 30
                                    radius: 8
                                    color: "#C8CDD1"
                                }
                            }

                        }

                        ColumnLayout {

                            Text {

                                text: qsTr("Exang")
                                font.bold: true
                                font.pointSize: 10
                                font.family: "Segoe UI"
                                color: "#406882"
                            }

                            TextField{
                                id:exang
                                anchors.leftMargin: 10
                                font.family: "Segoe UI"
                                font.pointSize: 12
                                height:30
                                width:100
                                background: Rectangle {
                                    implicitWidth: 100
                                    implicitHeight: 30
                                    radius: 8
                                    color: "#C8CDD1"
                                }
                            }

                        }

                        ColumnLayout {

                            Text {
                                text: qsTr("Major Vessels")
                                font.bold: true
                                font.pointSize: 10
                                font.family: "Segoe UI"
                                color: "#406882"
                            }

                            TextField{
                                id:ca
                                anchors.leftMargin: 10
                                font.family: "Segoe UI"
                                font.pointSize: 12
                                height:30
                                width:100
                                background: Rectangle {
                                    implicitWidth: 100
                                    implicitHeight: 30
                                    radius: 8
                                    color: "#C8CDD1"
                                }
                            }

                        }

                        ColumnLayout {

                            Text {
                                text: qsTr("Chest Pain Typ")
                                font.bold: true
                                font.pointSize: 10
                                font.family: "Segoe UI"
                                color: "#406882"
                            }

                            TextField{
                                id:cp
                                anchors.leftMargin: 10
                                font.family: "Segoe UI"
                                font.pointSize: 12
                                height:30
                                width:100
                                background: Rectangle {
                                    implicitWidth: 100
                                    implicitHeight: 30
                                    radius: 8
                                    color: "#C8CDD1"
                                }
                            }

                        }
                    }

                    ColumnLayout{
                        implicitHeight: parent.height
                        width: 400
                        Layout.leftMargin: 14


                        ColumnLayout {

                            Text {
                                text: qsTr("Blood Pressure")
                                font.bold: true
                                font.pointSize: 10
                                font.family: "Segoe UI"
                                color: "#406882"
                            }

                            TextField{
                                    id:trtbps
                                    anchors.leftMargin: 10
                                    font.family: "Segoe UI"
                                    font.pointSize: 12
                                    height:30
                                    width:100
                                    background: Rectangle {
                                            implicitWidth: 100
                                            implicitHeight: 30
                                            radius: 8
                                            color: "#C8CDD1"
                                        }
                            }

                        }

                        ColumnLayout {

                            Text {
                                text: qsTr("Cholestoral")
                                font.bold: true
                                font.pointSize: 10
                                font.family: "Segoe UI"
                                color: "#406882"
                            }

                            TextField{
                                id:chol
                                anchors.leftMargin: 10
                                font.family: "Segoe UI"
                                font.pointSize: 12
                                height:30
                                width:100
                                background: Rectangle {
                                        implicitWidth: 100
                                        implicitHeight: 30
                                        radius: 8
                                        color: "#C8CDD1"
                                }
                            }

                        }

                        ColumnLayout {

                            Text {
                                text: qsTr("F. Blood Sugar")
                                font.bold: true
                                font.pointSize: 10
                                font.family: "Segoe UI"
                                color: "#406882"
                            }

                            TextField{
                                id:fbs
                                anchors.leftMargin: 10
                                font.family: "Segoe UI"
                                font.pointSize: 12
                                height:30
                                width:100
                                background: Rectangle {
                                    implicitWidth: 100
                                    implicitHeight: 30
                                    radius: 8
                                    color: "#C8CDD1"
                                }
                            }

                        }

                        ColumnLayout {

                            Text {
                                text: qsTr("ECG")
                                font.bold: true
                                font.pointSize: 10
                                font.family: "Segoe UI"
                                color: "#406882"
                            }

                            TextField{
                                id:rest_ecg
                                anchors.leftMargin: 10
                                font.family: "Segoe UI"
                                font.pointSize: 12
                                height:30
                                width:100
                                background: Rectangle {
                                    implicitWidth: 100
                                    implicitHeight: 30
                                    radius: 8
                                    color: "#C8CDD1"
                                }
                            }

                        }

                        ColumnLayout {
                            visible: true
                            Text {
                                text: qsTr(" ")
                                font.bold: true
                                font.pointSize: 10
                                font.family: "Segoe UI"
                                color: "#ffffff"
                            }

                            Rectangle{
                                anchors.leftMargin: 10
                                height:30
                                width:100

                            }

                        }



                    }

                    ColumnLayout{
                        implicitHeight: parent.height
                        width: 400
                        Layout.leftMargin: 14


                        ColumnLayout {

                            Text {
                                text: qsTr("Max Heart Rate")
                                font.bold: true
                                font.pointSize: 10
                                font.family: "Segoe UI"
                                color: "#406882"
                            }

                            TextField{
                                id:thalach
                                anchors.leftMargin: 10

                                font.family: "Segoe UI"
                                font.pointSize: 12
                                height:30
                                width:100
                                background: Rectangle {
                                    implicitWidth: 100
                                    implicitHeight: 30
                                    radius: 8
                                    color: "#C8CDD1"
                                }
                            }

                        }

                        ColumnLayout {

                            Text {
                                text: qsTr("Slope")
                                font.bold: true
                                font.pointSize: 10
                                font.family: "Segoe UI"
                                color: "#406882"
                            }

                            TextField{
                                id:slp
                                anchors.leftMargin: 10
                                font.family: "Segoe UI"
                                font.pointSize: 12
                                height:30
                                width:100
                                background: Rectangle {
                                    implicitWidth: 100
                                    implicitHeight: 30
                                    radius: 8
                                    color: "#C8CDD1"
                                }
                            }

                        }

                        ColumnLayout {

                            Text {
                                text: qsTr("Previous Peak")
                                font.bold: true
                                font.pointSize: 10
                                font.family: "Segoe UI"
                                color: "#406882"
                            }

                            TextField{
                                id:oldpeak
                                anchors.leftMargin: 10

                                font.family: "Segoe UI"
                                font.pointSize: 12
                                height:30
                                width:100
                                background: Rectangle {
                                    implicitWidth: 100
                                    implicitHeight: 30
                                    radius: 8
                                    color: "#C8CDD1"
                                }
                            }

                        }

                        ColumnLayout {

                            Text {
                                text: qsTr("Thall Rate")
                                font.bold: true
                                font.pointSize: 10
                                font.family: "Segoe UI"
                                color: "#406882"
                            }

                            TextField{
                                id:thall
                                anchors.leftMargin: 10
                                font.family: "Segoe UI"
                                font.pointSize: 12
                                height:30
                                width:100
                                background: Rectangle {
                                    implicitWidth: 100
                                    implicitHeight: 30
                                    radius: 8
                                    color: "#C8CDD1"
                                }
                            }

                        }



                        ColumnLayout {

                            Text {
                                text: qsTr(" ")
                                font.bold: true
                                font.pointSize: 10
                                font.family: "Segoe UI"
                                color: "#ffffff"

                            }

                            Button{
                                anchors.leftMargin: 10
                                height:30
                                width:100
                                background: Rectangle {
                                    implicitWidth: 100
                                    implicitHeight: 30
                                    radius: 8
                                    color: "#406882"

                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        text: qsTr("Test")
                                        font.bold: true
                                        font.pointSize: 12
                                        font.family: "Segoe UI"
                                        color: "#ffffff"

                                    }
                                }
                                onClicked: {
                                    mainFunc.testClicked(aNumber, age.text, sex.text, exang.text, ca.text, cp.text, trtbps.text, chol.text, fbs.text, rest_ecg.text, thalach.text, oldpeak.text, slp.text, thall.text,knn_slider.value)
                                }
                            }

                        }


                    }




                        Rectangle{
                            id:result_rec
                            anchors.right: icerik.right
                            anchors.bottom: bottom_space.top
                            anchors.verticalCenter: parent.verticalCenter
                            Layout.leftMargin: 40
                            Layout.rightMargin: 40
                            Layout.topMargin: 60
                            Layout.bottomMargin: 60
                            Layout.maximumWidth: 300
                            Layout.maximumHeight: 300
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            color:"#DADFE2"
                            radius: 20
                            ColumnLayout{
                                Text {
                                    id:result_txt
                                    anchors.top:parent.top
                                    topPadding: 10
                                    leftPadding: 20
                                    anchors.left: parent.left
                                    text: qsTr("Result")
                                    font.bold: true
                                    font.pointSize: 16
                                    font.family: "Segoe UI"
                                    color: "#1A374D"

                                }



                                Rectangle{
                                    id:line2
                                    width: 80
                                    height: 3
                                    color: "#1A374D"
                                    anchors.top:result_txt.bottom
                                    Layout.leftMargin: 20

                                }










                        }

                            RowLayout{

                                Layout.leftMargin: 20
                                visible: true
                                anchors.top: line2.bottom
                                anchors.bottom: result_rec.bottom
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter

                                Image {
                                    id: status_img
                                    source: ""
                                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                    sourceSize.height: 40
                                    sourceSize.width: 40
                                    horizontalAlignment: Image.AlignHCenter
                                    verticalAlignment: Image.AlignVCenter
                                }

                                Text {
                                    id:status_txt
                                    leftPadding: 6
                                    anchors.left: status_img.right
                                    text: qsTr("")
                                    font.bold: true
                                    font.pointSize: 20
                                    font.family: "Segoe UI"
                                    color: "#20BF55"

                                }

                            }


                    }


                }


                Item{
                    id:bottom_space
                    height: 20
                    anchors.bottom: parent.bottom
                }

            }

        }




    }
}
