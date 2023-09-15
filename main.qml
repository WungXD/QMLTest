import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "compontents"
Window {
    id:root
    width: 640
    height:800
    visible: true
    title: qsTr("Hello World")
    property variant colorArray: ["#00bde3", "#67c111", "#ea7025"]
    //文字
    Text {
        x:30
        y:100
        width: 200
        id: name
        text: qsTr("a very long text come baby")
        elide: Text.ElideRight
        style: Text.Outline
        styleColor: "blue"
        color: "yellow"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter

    }



    //gif
     AnimatedImage {
        id: image2
        y: 320
        x : 30
        width : 100
        height: 100
        source: "res/loading.gif"
        cache: true
        Text {
            id: imageText
            width : 50
            height: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("text")
            font.pixelSize: 20
        }
    }
    //自定义button
     RichButton
     {
        id: richbutton
        text: "button"
        checkable: true
        x : 10
        width : 300
        height: 50
        onToggled :{
            if(richbutton.checked)
            {
                image1.rotation += 90
                image1.scale = 1
               // image2.x += 10;
            }
            else
            {
                //image2.x -= 10;
                image1.rotation -= 90
                image1.scale = 1
            }
        }
     }
    //椭圆button
     RoundButton
     {
         x : 400
         y : 10
         width: 50
         height: 50
         text: "roundbutton"
     }
      //网格布局
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
    //密码框
     TextField{
        placeholderText: qsTr("Enter password")
        placeholderTextColor : "#F5F5F5"
        x: 500
        y: 30
        width: 120
        height: 30
        color : "red"
        echoMode: TextInput.Password
        passwordCharacter: qsTr("*")
        background:Rectangle {
            color: "#DCDCDC"
            //radius: 6
            //border.color: "#000000"
            Rectangle {
                anchors.bottom: parent.bottom
                height: 1
                width: parent.width
                anchors.left: parent.anchors.left
                color: "#000000"
            }
        }

     }
     //简单的动画
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
         NumberAnimation on x{
             from : 20
             to: 200
             duration: 2000
             loops: Animation.Infinite
         }
         RotationAnimation on rotation {
             from : 0
             to: 360
             duration: 20
             loops: Animation.Infinite
         }
         PropertyAnimation on scale {
                 from : 1
                 to :0.1
                 duration: 2000
                 loops: Animation.Infinite
             }

         PropertyAnimation on opacity {
                 from :1
                 to :0
                 duration: 2000
                 loops: Animation.Infinite
             }
     }
     //应用动画
     RichImage{
        id : richImg
        x: 300
        y: 300
        source: "res/red_arrow.png"
        text: "1111"

        /*
        //方案一 通过点击进行移动
        Behavior on y{
               NumberAnimation{ duration: 100}
        }
        onClicked: y = 40+Math.random()*(205-40)
        */
        //方案二 从外界控制不同的动画属性
        onClicked:parAn.start()//seqAn.start()//  // numAn.start
        NumberAnimation {
            id: numAn
            target: richImg
            property: "y"
            duration: 2000
            //缓和曲线
            easing.type: Easing.OutElastic//Easing.InOutBounce//Easing.InElastic//Easing.Linear//Easing.InOutQuad//
            from: 300
            to: 100
        }
        //并行
        ParallelAnimation {
            id: parAn
            NumberAnimation {
            target: richImg
            properties: "y"
            from: 300
            to: 100
            duration: 1000
            //easing.type: Easing.InOutBounce
            }
            NumberAnimation {
            target: richImg
            properties: "x"
            from : 300
            to: 400
            //easing.type: Easing.InOutQuad
            duration: 1000
            }
            RotationAnimation {
                target: richImg
                properties: "rotation"
                from : 0
                to: 720
                duration: 1000
            }

        }
        SequentialAnimation
        {
            id: seqAn
            NumberAnimation {
            target: richImg
            properties: "y"
            from: 300
            to: 100
            duration: 1000
            //easing.type: Easing.InOutBounce
            }
            NumberAnimation {
            target: richImg
            properties: "x"
            from : 300
            to: 400
            //easing.type: Easing.InOutQuad
            duration: 1000
            }
        }
     }

     //状态位 与 过度(红绿灯)
     RgbLight{
        id: rgblight
        x: 340
        width: 50
        height: 100
     }

}
