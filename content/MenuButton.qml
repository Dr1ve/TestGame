import QtQuick 2.12

Rectangle {
    property string text
    signal clicked

    color: "green"
    border.width: 1
    radius: 10

    width: btnText.contentWidth > 150 ? btnText.contentWidth + 10 : 150
    height: 40

    Text {
        id: btnText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: parent.text
        font.pixelSize: 24
    }

    MouseArea {
        anchors.fill: parent
        onClicked: parent.clicked()
    }
}
