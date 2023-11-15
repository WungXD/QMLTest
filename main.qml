import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import "compontents"
Window {
    id:root
    width: 1000
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
         onClicked:
         {

         }
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
                anchors.left: parent.left
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
     Rectangle{
         id: image22
         color: "black"
         anchors.right: parent.right
         anchors.top: parent.top
         anchors.rightMargin:  2
         anchors.topMargin: 2

         width: 90
         height: 90
         //x : 400
        // y: 300

         Image {
             id: img
             anchors.fill: parent
             fillMode: Image.PreserveAspectFit
             source: "res/earth.jpg"

         }
         ColorOverlay{
           anchors.fill: img
           source: img
           color: "#80700000"

         }
     }
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

    //model view============================================
     //静态
     Column{
        spacing: 2
        x: 300
        y: 500
        Repeater{
            model:ListModel
            {
                ListElement{name: "lilei"; bcolor :"red"}
                ListElement{name: "hanmeimei"; bcolor :"blue"}
                ListElement{name: "david"; bcolor: "yellow"}
            }

            Rectangle{
                width: 100
                height: 20
                radius: 3
                color : bcolor
                Text{
                    anchors.centerIn: parent
                    text: name
                }

            }

        }
     }
     //动态

     Component {
         id: highlight
         Rectangle {
             width: 40; height: 40
             color: "#80b0c4de"; radius: 5
             y: list.currentItem.y
             z:2

            /* Behavior on y {
                            SequentialAnimation {
                                PropertyAnimation { target: highlightRectangle; property: "opacity"; to: 0; duration: 200 }
                                NumberAnimation { duration: 1 }
                                PropertyAnimation { target: highlightRectangle; property: "opacity"; to: 1; duration: 200 }
                            }
                        }
             Rectangle {
                             id: highlightRectangle
                             anchors.fill: parent
                             color: "lightGreen"
                         }
*/
             Behavior on y {
                 SpringAnimation {
                     spring: 3
                     damping: 0.2
                 }
             }
         }
     }

     ListView {
         id: list
         width: 180; height: 200
         x: 460
         y: 500
        //添加背景色
         Rectangle {
                 color: "lightblue"
                 anchors.fill: parent
                 z: -1
             }
         model: 5
        /* model:  ListModel {
             ListElement {
                 name: "Bill Smith"
                 number: "555 3264"
             }
             ListElement {
                 name: "John Brown"
                 number: "555 8426"
             }
             ListElement {
                 name: "Sam Wise"
                 number: "555 0473"
             }
         }*/
         clip: true
         delegate: numberDelegate
         spacing: 5
         highlight: highlight
         //highlightFollowsCurrentItem: ture
         focus: true
         header: headComp

     }
     Component{
            id: headComp
            Rectangle
            {
                width: 40
                height: 20
                color: "yellow"

                Text {
                    id: headText
                    text: qsTr("head")
                    anchors.centerIn: parent
                }
            }
     }
     Component {
             id: numberDelegate

             Rectangle {
                 width: 40
                 height: 40
                 property bool isCurItem: ListView.isCurrentItem
                 property bool isHover : false
                 //property alias textColor: text.color
                 color: ListView.isCurrentItem  ? "red" :isHover ? "red" : "lightGreen"

                 Text {
                     id: text
                     anchors.centerIn: parent

                     font.pixelSize: 14
                     font.bold: true
                     color:  isCurItem ? "black" : "white"
                     text: index
                 }
                 //list hover selected color
                 MouseArea
                 {
                     id:mouse
                     anchors.fill: parent
                     hoverEnabled: true
                     onEntered:{
                                isHover = true
                     }
                     onExited:{
                               isHover = false
                     }
                     onClicked:
                     {
                           list.currentIndex = index
                     }
                 }
             }
         }

     ExpandedView{
         x: 400
         y: 200

     }
    //path view ==============================
     ListPathView{
        x: 700
        y: 200
        width: 80
        height: 300

     }
    //liveview 结合section可以达到分段的目的 通过设置section.property: 进行分组
     //...

     //canvas
     Canvas{
        x: 700
        width :200
        height: 150

        onPaint:
        {
            var ctx = getContext("2d")
            ctx.fillStyle = "lightGray"
            ctx.fillRect(0,0,200,200)
            // setup the stroke
            ctx.strokeStyle = "red"
            // create a path
            ctx.beginPath()
            ctx.moveTo(50,50)
            ctx.lineTo(150,50)
            // stroke path
            ctx.stroke()

            ctx.fillStyle = "red"
            ctx.fillRect(150,50,40,40)
        }
     }
}
