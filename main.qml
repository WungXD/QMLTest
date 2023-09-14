import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id:root
    width: 640
    height:800
    visible: true
    title: qsTr("Hello World")
    property variant colorArray: ["#00bde3", "#67c111", "#ea7025"]
    Text {
        x:30
        y:100
        width: 300
        id: name
        text: qsTr("a very long text come baby")
        elide: Text.ElideRight
        style: Text.Outline
        styleColor: "blue"
        color: "yellow"
        font.pixelSize: 30
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter

    }
    Image {
        id: image1
        y: 200
        x : 30
        source: "https://www.baidu.com/img/flexible/logo/pc/result@2.png"
        sourceSize.width: 200
        sourceSize.height: 100
        MouseArea
        {
            id: area
            width: parent.width
            height: parent.height
            onClicked: image1.x += 1
        }
    }
     AnimatedImage {
        id: image2
        y: 400
        x : 30

        source: "res/go-goal.gif"
    }

     Button
     {
        id: mybutton
        text: "button"
        checkable: true
        x : 10
        width : 300
        height: 50
        BorderImage {
            id: borderImg
            anchors.fill: parent;
            source: "res/18.png"
            border.left: 5
            border.top: 5
            border.right: 5
            border.bottom: 5
        }
        contentItem: Text {
           /* id: centText
            text: mybutton.text
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            color: mybutton.down ? "#00008B" : "#4682B4"*/
            id: txt
            width : 30
            x:  (mybutton.width - txt.width)/ 2
            y:  (mybutton.height - txt.height) / 2

            text: mybutton.down ? "pressed" : mybutton.hovered ? "hover" : mybutton.checked ? "checked" : "unchecked"
            color: "red"
            font.pixelSize: 14
            font.bold: true
            horizontalAlignment: Text.Center
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle{
            radius: 4
            //implicitWidth: 10
            //implicitHeight: 40

            border.color: "#000000"

            color: mybutton.down ? "#d0d0d0" : mybutton.hovered ? "#9933FA" : mybutton.checked ? "#DA70D6" : "#DDA0DD"
            //设置只有一边圆角 右边画一个矩形遮盖
            Rectangle{
                id: rightRect
                anchors.right: parent.right
                width: 10
                height: parent.height
                border.color: "#000000"
                color: parent.color
                //有boder 就再画个矩形遮盖
                Rectangle{
                    width: 2
                    y :1
                    height: parent.height -2
                    anchors.left: parent.left
                    color: parent.color
                }
            }
           /* Text {
                id: txt1
                width : 30
                x:  (mybutton.width - txt.width)/ 2
                y:  (mybutton.height - txt.height) / 2

                text: mybutton.down ? "pressed" : mybutton.hovered ? "hover" : mybutton.checked ? "checked" : "unchecked"
                color: "red"
                font.pixelSize: 14
                font.bold: true
                horizontalAlignment: Text.Center
                verticalAlignment: Text.AlignVCenter

            }*/
        }
        onToggled :{
            if(mybutton.checked)
            {
                image2.rotation += 90
                image2.scale = 2.0
            }
            else
            {
                image2.rotation -= 90
                image2.scale = 1.0
            }
        }
     }
     RoundButton
     {
         x : 400
         y : 10
         width: 50
         height: 50
         text: "roundbutton"
     }
     Grid{
        x: 10
        y: 500
        width :400
        height: 400
        spacing: 4
        Repeater{
            model: 16
            Rectangle {
                width: 56; height: 56
                property int colorIndex: Math.floor(Math.random()*3)
                color: root.colorArray[colorIndex]
                border.color: Qt.lighter(color)
                Text {
                    anchors.centerIn: parent
                    color: "#f0f0f0"
                    text: "Cell " + index
                }
            }

        }

     }
}
