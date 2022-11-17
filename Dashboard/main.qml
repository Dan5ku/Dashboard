import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick

Window {
    width: 1000
    height: 500
    visible: true
    title: qsTr("Hello World")
    Rectangle {
        property bool engineRunning: false
        id: dashboardBackground
        anchors.fill: parent
        color: "black"

        Tachometer{
            id: tachometer
            opacity: 0
            rpm: 0
            Behavior on opacity{
                PropertyAnimation {
                    easing.type: Easing.InCubic
                    duration: 1000
                }
            }
        }
        Speedometer{
            id: speedometer
            x: 500
            opacity: 0
            kmh: 0
            Behavior on opacity{
                PropertyAnimation {
                    easing.type: Easing.InCubic
                    duration: 1000
                }
            }
        }
        Text {
            id: motorStatusText
            opacity: 0.5
            color: "#f77817"
            text: "Engine Stopped"
            font.pointSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            Behavior on opacity {
                PropertyAnimation {
                    easing.type: Easing.InCubic
                    duration: 1000
                }
            }
        }
        Text {
            id: gearStatusText
            opacity: 0
            color: "#f77817"
            text: "1"
            font.pointSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            padding: 50
            Behavior on opacity {
                PropertyAnimation {
                    easing.type: Easing.InCubic
                    duration: 1000
                }
            }
        }
        //oma nappula ruudulle
        Button {
            buttonText: "Start/\nStop"
            backgroundColor: "limegreen"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            onButtonClicked: {
                if(dashboardBackground.engineRunning == false){
                    startEngine();
                }
                else{
                    stopEngine();
                }
            }
        }
        Button {
            id: button2
            buttonText: "Throttle"
            backgroundColor: "darkred"
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            opacity: 0
            Behavior on opacity {
                PropertyAnimation {
                    easing.type: Easing.InCubic
                    duration: 1000
                }
            }
            onButtonClicked: {
                if(dashboardBackground.engineRunning == true){
                    throttle();
                }
            }
        }
        Image {
            id: engineIcon
            source: "icons8-automotive-65.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            opacity: 0
            Behavior on opacity {
                PropertyAnimation {
                    easing.type: Easing.InCubic
                    duration: 1000
                }
            }
        }
    }
    function startEngine(){
        // käsitellään buttonin signaali (tämä on slot)
        motorStatusText.text = "Engine Running"
        motorStatusText.opacity = 1
        gearStatusText.opacity = 1
        if (tachometer.rpm < 8000){
            tachometer.rpm += 1000
            }
        else {
            tachometer.rpm = 1000
        }
        speedometer.opacity = 1
        tachometer.opacity = 1
        button2.opacity = 1
        gearStatusText.opacity = 1
        dashboardBackground.engineRunning = true;
    }
    function stopEngine(){
        motorStatusText.text = "Engine Stopped"
        motorStatusText.opacity = 0.1
        gearStatusText.opacity = 0.1
        speedometer.opacity = 0
        tachometer.opacity = 0
        dashboardBackground.engineRunning = false;
        tachometer.rpm = 0;
        speedometer.kmh = 0;
        gearStatusText.text = "1"
        engineIcon.opacity = 0
        button2.opacity = 0
        gearStatusText.opacity = 0
    }
    function throttle(){
        speedometer.kmh += 20
        tachometer.rpm += 1000
        if (tachometer.rpm == 3000 && speedometer.kmh == 40){
            tachometer.rpm = 1000
            gearStatusText.text = "2"
        }

        else if (tachometer.rpm == 4000 && speedometer.kmh == 100 ){
                tachometer.rpm = 1000
                gearStatusText.text = "3"
        }
        else if (tachometer.rpm == 5000 && speedometer.kmh == 180 ){
                tachometer.rpm = 2000
                gearStatusText.text = "4"
        }
        if (speedometer.kmh > 260){
            speedometer.kmh = 260
            engineIcon.opacity = 1
        }
        if (tachometer.rpm > 8000)
            tachometer.rpm = 8000
    }
}
