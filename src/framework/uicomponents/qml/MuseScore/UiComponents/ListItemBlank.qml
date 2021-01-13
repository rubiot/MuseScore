import QtQuick 2.5

import MuseScore.Ui 1.0

Item {
    id: root

    property bool isSelected: false

    signal clicked()
    signal doubleClicked()

    implicitHeight: 30
    implicitWidth: ListView.view.width

    Rectangle {
        id: background

        anchors.fill: parent

        color: "transparent"
        opacity: 1
    }

    states: [
        State {
            name: "HOVERED"
            when: mouseArea.containsMouse && !mouseArea.pressed && !root.isSelected

            PropertyChanges {
                target: background
                opacity: ui.theme.buttonOpacityHover
                color: ui.theme.buttonColor
            }
        },

        State {
            name: "PRESSED"
            when: mouseArea.pressed && !root.isSelected

            PropertyChanges {
                target: background
                opacity: ui.theme.buttonOpacityHit
                color: ui.theme.buttonColor
            }
        },

        State {
            name: "SELECTED"
            when: root.isSelected

            PropertyChanges {
                target: background
                opacity: ui.theme.accentOpacityHit
                color: ui.theme.accentColor
            }
        }
    ]

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        hoverEnabled: true

        onClicked: {
            root.clicked()
        }

        onDoubleClicked: {
            root.doubleClicked()
        }
    }
}
