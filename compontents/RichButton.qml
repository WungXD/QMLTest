import QtQuick 2.15
import QtQuick.Controls 2.15

Button
{
   id: mybutton

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

}
