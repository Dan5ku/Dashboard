import QtQuick 2.15

Rectangle{
    property int kmh: 0
    Image {
        width: 500
        height: 500
        id: name
        source: "speedo.png"
        Image {
            id: redNeedle
            height: parent.height * 0.35
            source: "needlered.png"
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -0.5 * height
            rotation: -136 + kmh / 20 * 21
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
