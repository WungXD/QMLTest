import QtQuick 2.15

Item {
    id : root
    width:contaienrCol.childrenRect.width
    height: contaienrCol.childrenRect.height
    property alias text : label.text
    property alias source: socketImg.source
    signal clicked
    Rectangle{
           anchors.fill: parent
           color:"white"
           border.color: "#000000"

    }
    Column {
        id : contaienrCol
        Image{
            id: socketImg
        }
        Text{
            id: label
            horizontalAlignment: Text.horizontalCenter
            verticalAlignment: Text.verticalCenter
            anchors.horizontalCenter:  socketImg.horizontalCenter
            color: "#DC143C"
            font.bold: true
            font.pixelSize: 14
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: root.clicked()
        }


}
