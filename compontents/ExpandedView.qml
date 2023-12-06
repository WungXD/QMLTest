import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Item {

    width : 300
    height:480
    ListView{
        id:listView
        anchors.fill: parent
        model: planets
        delegate: detailsDelegate

    }



    ListModel{
        id : planets
        ListElement { name: "Mercury"; imageSource: "../res/mercury.jpg";facts: "Mercury is the smallest planet in the Solar System.It is the closest planet to the sun. It makes one trip around the Sun once every 87.969 days." }
        ListElement { name: "Earth"; imageSource: "qrc:/res/earth.jpg";facts: "The Earth is the third planet from the Sun. It is one of the four terrestrial planets in our Solar System. This means most of its mass is solid. The other three are Mercury, Venus and Mars. The Earth is also called the Blue Planet, 'Planet Earth', and 'Terra'." }
    }

    Component
    {
        id: detailsDelegate
        Item{
            id: wrapper
            width: listView.width
            height: 30

            Rectangle{

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top:  parent.top

                height:30
                color: "#ffaa00"
                Text{
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: parent.height -4
                    text: name

                }
            }
             Rectangle{
                 id: image1
                 color: "black"
                 anchors.right: parent.right
                 anchors.top: parent.top
                 anchors.rightMargin:  2
                 anchors.topMargin: 2

                 width: 26
                 height: 26

                 Image {
                     anchors.fill: parent
                     fillMode: Image.PreserveAspectFit
                     source: imageSource
                 }
             }

            MouseArea{

                anchors.fill: parent
                onClicked: parent.state = "expanded"
            }

            Item {
                id: factsView
                anchors.top: image1.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                opacity:0
                Rectangle
                {
                    anchors.fill: parent
                    color: "#cccccc"
                    Text {
                        anchors.fill: parent
                        anchors.margins: 5
                        clip: true
                        wrapMode: Text.WordWrap
                        font.pixelSize: 12
                        text: facts
                    }

                }


            }

            Rectangle{
                id: closeBtn
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 2
                anchors.topMargin: 2

                width: 26
                height: 26

                color: "red"
                opacity: 0

                MouseArea{
                    anchors.fill: parent
                    onClicked: wrapper.state = ""
                }

            }

            states:[
                State {
                    name: "expanded"
                    PropertyChanges { target: wrapper; height: listView.height}
                    PropertyChanges { target: image1; width: listView.width; height: listView.width; anchors.rightMargin: 0; anchors.topMargin: 30 }
                    PropertyChanges { target: factsView; opacity: 1 }
                    PropertyChanges { target: closeBtn; opacity: 1 }
                    PropertyChanges { target: wrapper.ListView.view; contentY: wrapper.y; interactive: true }

                }


            ]
            transitions: [
                           Transition {
                               NumberAnimation {
                                   duration: 200;
                                   properties: "height,width,anchors.rightMargin,anchors.topMargin,opacity,contentY"
                               }
                           }
                       ]

        }

    }

}
