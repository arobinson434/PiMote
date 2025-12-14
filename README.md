# pi_mote
An universal remote control application written with Flutter.

## Quick Start
* [Overview](#overview)
* [Build & Install](#build-and-install)
* [Create a Remote](#create-a-remote)
* [Edit a Remote](#edit-a-remote)
* [Select a Device](#select-a-device)

## Overview
This app is part of a larger project to allow you to store infrared (IR) commands
from TV remotes and other common devices on your phone, and then allows you to 
replay those commands. Essentially, this project lets you turn your phone into a
universal remote.

This repo houses the phone app that allows you to build a virtual remote, record
IR commands, and replay commands.

This app is intended to interact with a Raspberry Pi over Wi-Fi. Head on over to
my [PiIrRelay](https://github.com/arobinson434/PiIrRelay) project to read about
setting up that side of things. Needless to say, the Pi handles the physical IR
side of things.

In the end, you can build remotes like this to control your home devices

<img src="https://github.com/arobinson434/PiMote/blob/main/docs/large_remote.png" alt="Large Remote" style="width:300px;" />

The app also supports light and dark modes

<img src="https://github.com/arobinson434/PiMote/blob/main/docs/small_remote_dark.png" alt="Large Remote" style="width:300px;" /> | <img src="https://github.com/arobinson434/PiMote/blob/main/docs/small_remote_light.png" alt="Large Remote" style="width:300px;" />

## Build and Install
I have only tested this app on MacOS and Android devices. Feel free to try
other platforms, but that's all I can vouch for.

Building this app for android is straightforward. Just run
```
flutter build apk
```

Then to install on your device, ensure that it is connected and in debug mode.
Then run,
```
flutter install -d <your_device>
```

## Create a Remote
To create a new remote, click the hamburger menu on the top-left, then select
"New Remote" at the bottom of the menu. This will launch the following screen
where you can name your remote, and select its dimensions.

<img src="https://github.com/arobinson434/PiMote/blob/main/docs/new_remote.png" alt="New Remote" style="width:300px;" />

## Edit a Remote
Once the new remote is selected, you can click the "Edit" button at the bottom
of the screen to enable editing.

<img src="https://github.com/arobinson434/PiMote/blob/main/docs/edit_mode.png" alt="Edit Mode" style="width:300px;" />

When in editing mode, clicking buttons will launch the button editor.

<img src="https://github.com/arobinson434/PiMote/blob/main/docs/button_editor.png" alt="Button Editor" style="width:300px;" />

By clicking the large button on the button editor, you can select the icon to use.

<img src="https://github.com/arobinson434/PiMote/blob/main/docs/icon_selection.png" alt="Icon Selection" style="width:300px;" />

Additionally, the two buttons below the icon will allow you to either scan for
an IR command (left) or delete the command currently associated with this
button (right). When scanning, simply click your remote into the sensor on your
Pi and the command should show up on your phone. You can then choose to accept
that command for this button.

## Select a Device
Lastly, to start using the app, you will have to choose an IR relay device to
use, ie which raspberry pi should replay your button pushes.

To do this, select the wireless icon at the bottom of the screen to scan for
devices on your network. The pi's should send out a presence notification every
5 seconds.

<img src="https://github.com/arobinson434/PiMote/blob/main/docs/device_selection.png" alt="Device Selection" style="width:300px;" />

After that, buttons you click in the app will be replayed from this device.
