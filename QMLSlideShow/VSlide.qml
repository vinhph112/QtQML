import QtQuick 2.0

Item {
    id: rec

    // [1] First image is to be display is pics/1.jpg,
    // followed by 2.jpg, 3.jpg, etc...
    property int currentIndex: 1
    property int nextIndex: 2
    property int timeShow: 5000
    // [2] When swapping the image sources we need
    // to block the animation behaviour.
    // By default turn it on.
    property bool allowBehaviour: true

    // [3] When the 'rec' is loaded
    // set the current image to fade out
    // and the next image to fade in.
    Component.onCompleted: {
        currentImage.opacity = 0;
        nextImage.opacity = 1;
    }

    Image {
        id: currentImage
        source:  "slideshow/img_0" + currentIndex + ".jpg"
        opacity: 1
        anchors.fill: parent

        // [4] Here we define that whenever we change the
        // opacity we want it to animate. Notice the enable
        // is tied to `allowBehaviour`
        Behavior on opacity {
            enabled: allowBehaviour
            NumberAnimation { easing.type: Easing.InOutQuad; duration: 2500 }
        }
    }

    Image {
        id: nextImage
        source:  nextIndex == 4 ? "slideshow/img_01.jpg" : "slideshow/img_0" + nextIndex + ".jpg"
        opacity: 0
        anchors.fill: currentImage

        // [5] See [4] above.
        Behavior on opacity {
            enabled: allowBehaviour
            NumberAnimation { easing.type: Easing.InOutQuad; duration: 2500 }
        }
    }

    Timer {
        interval: timeShow
        repeat: true
        running: true
        onTriggered: {
            // [6] Block the Behaviour animation.
            allowBehaviour = false;

            // [7] Advance the indices.



            //console.log(currentIndex,nextIndex)
            currentIndex = nextIndex;
            ++nextIndex;
            if (nextIndex == 4) {
                nextIndex = 1
            }
            // [8] This is key, set the current
            // image to visible and the next
            // image to invisible. This happens
            // instantly as the Behaviour is off.
            currentImage.opacity = 1;
            nextImage.opacity = 0;

            // [9] Turn the behaviour so the
            // opacity change at [10] will
            // cause an animation.
            allowBehaviour = true;

            // [10] Like [3] set the current
            // image to fade out and the
            // next image to fade in.
            currentImage.opacity = 0;
            nextImage.opacity = 1;
        }
    }
    Behavior on y{
        NumberAnimation { duration: 380 }
    }
    Behavior on x{
        NumberAnimation { duration: 400 }
    }
}

