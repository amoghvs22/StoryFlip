[![Swift Version][swift-image]][swift-url]

# StoryFlip
An Instagram style image/video control that animates segments like Snapchat or Instagram Stories. 
This is an example project and not a framework.

## Requirements
- iOS 10.2+
- Xcode 8

## Usage
Create Media objects based on media type(photo/video) from the bundle
```swift
 let media: Media  = Media(url: defaultURL + "/pic1.jpeg", type: Type.Photo, duration: 5)
 ```
 
 Create a UserInfo object and add the Media objects to the images array
 ```swift
 let userInfo = UserInfo()
 userInfo.profileImage = UIImage(named: "profilePic1")
 userInfo.userName = "Amogh"
 let media: Media  = Media(url: defaultURL + "/pic1.jpeg", type: Type.Photo, duration: 5)
 let media1:Media  = Media(url: defaultURL + "/video1.mp4", type: Type.Video, duration: nil)
 let media2: Media  = Media(url: defaultURL + "/pic2.jpg", type: Type.Photo, duration: 5)
 userInfo.images = [media, media1, media2]
 ```
 
 Load StoryViewController and set the UserInfo object of the VC
 ```swift
 let vc = StoryViewController()
 vc.userInfo = cell.info
 self.present(vc, animated: true, completion: nil)
 ```
[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
