import QtQuick 2.15

Rectangle{
    //Kierroslukumittarin propertyt
    property int rpm: 0
    Image {
        width: 500
        height: 500
        id: name
        source: "tacho.png"
        Image {
            id: redNeedle
            height: parent.height * 0.35
            source: "needlered.png"
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -0.5 * height
            rotation: -121 + rpm / 1000 * 30 //1000 kierrosta == 30 astetta kiertoa myötäpäivään
            transformOrigin: Rectangle.Bottom
            Behavior on rotation{
                PropertyAnimation{
                    easing.type: Easing.OutQuad
                    duration: 1000
                }
            }
        }
    }
}
