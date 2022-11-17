import QtQuick 2.15

Rectangle {
    //Määritellään buttonin lähettämät tapahtumat (signaalit)
    signal buttonClicked

    id: button2
    height: 80
    width: 80
    radius: 50
    color: backgroundColor
    Text {
        text: parent.buttonText
        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent
        onPressAndHold:  {
            parent.width = 75
            parent.height = 75
        }
        onReleased: {
            parent.width = 80
            parent.height = 80

            //lähetetään (emittoidaan) signaali (signaali on javascript -funktio)
            parent.buttonClicked()
        }
    }
}
