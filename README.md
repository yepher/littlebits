![App Icon](https://raw.githubusercontent.com/yepher/littlebits/master/mac/LittleBits/LittleBits/Images.xcassets/AppIcon.appiconset/icon_128x128.png)

This project is for connecting to the CloudBit made By [LittleBits](http://littlebitscloud.cc). Check them out to get more information.

![http://littlebits.cc/](https://s3.amazonaws.com/media.littlebits.cc/images/littlebits-logo.svg)

### LittleBit API for Mac and iOS

#### Prerequisites
1. Have a littleBits account to associate your cloudBit to; [Create account](https://littlebits.cc/signup).
2. Get `ACCESS_TOKEN` and `CLOUDBIT_ID` from [Cloud Control](control.littlebitscloud.cc)

#### References

* My API Notes [API Notes](https://github.com/yepher/littlebits/blob/master/CloudBit_ProtocolNotes.md)
* LittleBits API [Access API](http://developer.littlebitscloud.cc/access) 
* LittleBits API [HTTP API](http://developer.littlebitscloud.cc/api-http)
* Littlebits API [API Examples](https://github.com/littlebits/cloud-api-lessons)

#### Project Layout

* `common` - this is used by both Mac and iOS so it must not contain platform specific code
* `common/extern` - common external dependencies (better to use CocoaPods when possible)
* `common/data` - common Over The Air (OTA) data types
* `common/protocol` - The cloudbit protocol

* `ios` - all IOS project code, resources etc
* `mac` - all OSX project code, resources etc

#### Next Steps

* Implement ability to configuring WiFi in cloud bit from Mac or iOS app


### Mac App

To use the Mac App:
* Launch app
* Get your [API token](http://developer.littlebitscloud.cc/access)
* Paste `token` into the `LittleBites Token` text field
* Press `Load Devices`
* Select device from list
* Control device with slider or push trigger button
* Click monitor device to monitor the input state of the selected cloud bit

![Main Window](https://raw.githubusercontent.com/yepher/littlebits/master/design/screen/mainScreen.png)

### iOS App

TODO