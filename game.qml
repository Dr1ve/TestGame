import QtQuick 2.12
import "content"

Rectangle {
    id: root

    visible: true
    height: Settings.screenHeight
    width: Settings.screenWidth

    // Состояния игры
    state: "STARTING"
    states: [
        // Игра только запустилась
        State { name: "STARTING" },
        // В игре
        State { name: "INGAME" }
    ]

    Item {
        id: menu
        width: parent.width
        anchors.top: parent.top
        anchors.bottom: buttomBar.top
        anchors.margins: 10
        visible: (root.state == "STARTING")

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height - Settings.footerHeight
            spacing: 10
            MenuButton {
                text: "Старт"
                onClicked: {
                    root.state = "INGAME"
                }
            }
            MenuButton {
                text: "Настройки"
            }

            MenuButton {
                text: "Выход"
                onClicked: Qt.quit()
            }
        }

    }

    Item {
        id: buttomBarInGame
        width: parent.width
        height: Settings.footerHeight
        y: parent.height - Settings.footerHeight;

        MenuButton {
            text: "Меню"
            visible: (root.state == "INGAME")
            onClicked: {
                root.state = "INGAMEMENU"
            }
        }
        MenuButton {
            text: "Вернуться в Главное меню"
            visible: (root.state == "INGAMEMENU")
            onClicked: {
                root.state = "STARTING"
            }
        }
    }
    focus: true
    Keys.onEscapePressed: Qt.quit()
}
