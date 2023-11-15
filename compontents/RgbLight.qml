import QtQuick 2.15

Item {
    id: root
    x: 340
    width: 50
    height: 100
    state:"stop"
    states:[
        State{
            name : "stop"
            PropertyChanges {
                target: redLight
                color: "red"
            }
            PropertyChanges {
                target: greenLight
                color: "black"
            }
        },
        State{
            name : "go"
            PropertyChanges {
                target: redLight
                color: "black"
            }
            PropertyChanges {
                target: greenLight
                color: "green"
            }
        },
        State {
            name: "attention"
            PropertyChanges {
                target: redLight
                color: "black"
            }
            PropertyChanges {
                target: greenLight
                color: "yellow"

            }
        }
    ]
    //stop 状态到 go状态的过度效果
    transitions: [
        Transition {
        from: "stop";
        to: "go"

        ColorAnimation {
           target:redLight
           //properties: "color"
            duration: 500
        }
        ColorAnimation {
           target:greenLight
           //properties: "color"
            duration: 500
        }
        }


    ]
    SequentialAnimation
    {
        id: blinkAn
        loops: Animation.Infinite
        ColorAnimation {
        target: greenLight
        properties: "color"
        from: "yellow"
        to: "black"
        duration: 500
        }
        ColorAnimation {
        target: greenLight
        properties: "color"
        from: "black"
        to: "yellow"
        duration: 500
        }
    }

    Timer
    {
        interval: 3000
        running: true
        repeat: true
        onTriggered: {
            blinkAn.stop()
            if(parent.state == "stop")
            {
                parent.state = "go"
            }
            else if(parent.state == "go")
            {
                parent.state = "attention"
                blinkAn.start()
            }
            else
            {
                parent.state = "stop"
            }
        }
    }
    MouseArea {
    anchors.fill: parent
    /*onClicked: {
        blinkAn.stop()
        if(parent.state == "stop")
        {
            parent.state = "go"
        }
        else if(parent.state == "go")
        {
            parent.state = "attention"
            blinkAn.start()
        }
        else
        {
            parent.state = "stop"
        }
    }*/
    }


    Rectangle{
        id: redLight
        x: 5
        y: 5
        width: 40
        height: width
        radius: width/2
        color:  "#000000"
    }
    Rectangle{
        id: greenLight
        x: 5
        y: 50
        width: 40
        height: width
        radius: width/2
        color:  "#000000"
    }

}
