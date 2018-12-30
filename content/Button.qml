import QtQuick 2.12

Item {
    property alias imgSrc: image.source

    signal clicked

    width: image.width
    height: image.sourceSize.height
    Image {
        id: image
        height: parent.height
        width: height/sourceSize.height * sourceSize.width

        anchors.horizontalCenter: parent.horizontalCenter

    }

    MouseArea {
        anchors.fill: parent
        onClicked: parent.clicked()
    }
}
