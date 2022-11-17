import QtQuick 2.15

Rectangle {
    property string buttonText: ""
    property color backgroundColor: "limegreen"
    //Määritellään buttonin lähettämät tapahtumat (signaalit)
    signal buttonClicked

    height: 100
    width: 100
    radius: 50
    color: backgroundColor
    Text {
        text: parent.buttonText
        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent
        onPressed:  {
            parent.width = 95
            parent.height = 95
        }
        onReleased: {
            parent.width = 100
            parent.height = 100

            //lähetetään (emittoidaan) signaali (signaali on javascript -funktio)
            parent.buttonClicked()
        }
    }
}
