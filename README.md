# Affinity 
🗓 프로젝트 소개 : 신발 커뮤니티 앱 </br>
🗓 기간 : 2022.10.15 ~  2023.3.21  </br>
🗓 팀원: [로이](https://github.com/Roy-wonji), [민](https://github.com/italsehf), [영](https://github.com/Dtzer0), [소낙](https://github.com/choo121600), [리넴](https://github.com/Duckduck1596), 루비 </br>

<br>

## Affinity에 대하여

> 많은 인기를 얻고 있는 신발이 무엇이 있는지를 확인해볼 수 있습니다. <br>
> 신발과 관련하여 자유롭게 이야기를 나눌 수 있는 커뮤니티 기능을 담고 있습니다. <br>

<br>

## App Icon  
<img src= "https://user-images.githubusercontent.com/75601594/221594192-8eb68e34-bcab-4319-8f69-81b2ecdf9492.png"  width="30%">

<br>

## App Store
<a href="https://apps.apple.com/us/app/affinity/id1665706797" style="display: inline-block; overflow: hidden; border-radius: 13px; width: 250px; height: 83px;"><img src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/black/en-US?size=250x83&amp" alt="Download on the App Store" style="border-radius: 13px; width: 250px; height: 83px;"></a>

<br>

## 팀원 소개

## 👨🏻‍💻👩🏻‍💻👩🏻‍🎨 Team 

|Developer|Product Manger|Developer|Developer|Developer|Designer|
|:-:|:-:|:-:|:-:|:-:|:-:|
|<img src="https://user-images.githubusercontent.com/75601594/234147001-86411f85-4f56-4b8d-baad-eba7218278a2.PNG" width="120">|<img src="https://user-images.githubusercontent.com/75601594/234175100-b6058283-c72e-428e-a4a3-3d57bd8f6f7a.png" width="120">|<img src="https://user-images.githubusercontent.com/75601594/234175182-0986c72b-d45e-4e6b-b596-460ecf85cbe1.png" width="120">|<img src="https://user-images.githubusercontent.com/75601594/234174853-3eca2f08-c759-4158-8ee1-5b3c210cdd06.jpeg" width="120" height="120">|<img src="https://i.imgur.com/X8yRfcy.png" width="120">|<img src="https://user-images.githubusercontent.com/75601594/234147178-39330bb0-343d-4d1a-bc34-956c2491eb6a.png" width="120">|
|[Roy](https://github.com/Roy-wonji)|[Min](https://github.com/italsehf)|[Sonak](https://github.com/choo121600)|[Young](https://github.com/Dtzer0)|[Linem](https://github.com/Duckduck1596)|Ruby|

<br>


## App UI
- [피그마](https://www.figma.com/file/2vhHPVAEBXwgygOfJ5mYqv/AFFINITY-UI-DESIGN?node-id=465%3A5315&t=jLss8pZEyv8kTPw5-1)

<br>

## 사용한 라이브러리
- `Alamofire` , `Kingfisher` , `SwiftLint`,  `Firebase` ,  `Moya`

<br>

## 🛠 Developement Environment

|Environment|Version|
|:-:|:-:|
|Swift|5.7|
|Xcode|14.0|
|iOS Deployment Target|16.0|

<br>


## 사용한 api
### 📝 신발 관련 MOCK API
```swift
let url = URL(string : "https://640de3d61a18a5db83827295.mockapi.io/shoes")
```
<br>

### 📝 신발 상세 MOCK API
```swift
let url = URL(string : "https://640de3d61a18a5db83827295.mockapi.io/shoes/id")
```

<br>

## 사용한 협업툴 
- `Notion` , `Figma`

<br>

## 사용한 자동화 
- `Fastlane` , `Slack`
<br

## 디자인 패턴
- MVVM 패턴 

<br>

## 키워드 
- `@published`
- `@State`
- `@EnvironmentObject`
- `Combine`
- `커스텀 폰트`
- `커스텀 컬러`
- `extension view`
- `Alamofire 통신`
- `컴포넌트 분리`
- `Search bar`
- `Firebase RemoteConfig`
- `Firebase Crashlytics`
- `Firebase FCM`

<br>

## 폴더링

```
📦── MarketApp
│   ├── Info.plist
│   📦── MarketAppTests
│   📦── MarketAppUITests
│   📦── Resources
│   │   📂── Firebase
│   │   📂── Assets.xcassets
│   │   📂── ColorAssets.xcassets
│   │   📂── IconImage
│   │   📂── Loading.json
│   │   📂── MarketApp.entitlements
│   │   📂── Preview Content
│   │   📂── mockData.json
│   📦── Sources
│       📂── Application
│       📂── Model
│       📂── Network
│       📂── UI
│       📂── View
│       │   📂── Component
│       │   │   📂── Alert
│       │   │   📂── Lanch
│       │   │   📂── List
│       │   │   📂── Lottie
│       │   │   📂── Page
│       │   │   📂── Search
│       │   │   📂── Share
│       │   │   📂── TextField
│       │   │   📂── WebView
│       │   📂── Authorization
│       │   │   📂── FindEmail
│       │   │   📂── FindPassword
│       │   │   📂── Login
│       │   │   📂── LoginItem.swift
│       │   │   📂── LoginView.swift
│       │   │   📂── SignUP
│       │   📂── Home
│       │   📂── Notic
│       │   📂── ProductDetail
│       │   📂── ProductList
│       │   📂── Profile
│       │   📂── Search
│       │   📂── Tab
│       │   📂── Favorite
│       📂── Util
│       │   📂── AppCheck
│       │   📂── Authoriation
│       │   📂── Color
│       │   📂── Extensions
│       │   📂── Font
│       │   │    📂── CustomFont
│       │   │    📂── FontAsset
│       │   📂── ImageMange
│       │   📂── SignUPCheck
│       │   📂── View
│       │   │    📂── ModalView
│       │   │    📂── ScrollView
│       │   │    📂── CustomFont
│       │   │    📂── ScreenSize
│       📂── ViewModel
│       │   📂── MainShoesViewModel
│       │   📂── ProfileViewModel
│       └   📂── SignUpViewModel
📦── fastlane
│    📂── metadata
│    │    📂── ko
│    │    📂── review_information
│    📂── output
│    📂── screenshots
│    │    📂── ko
└──  📂── test_output
```
<br>

## 구현 내용 

<br>

## 네트워크 통신

### viewModel 구현 

<br>

## Design System

```swift
import UIKit
import SwiftUI

enum NanumSquareNeoFamily: String {
    case aLt, bRG, cBd, dEb, eHv
}


struct NanumSquareNeoFont: ViewModifier {
    var family: NanumSquareNeoFamily
    var size: CGFloat
    var color: Color
    
    func body(content: Content) -> some View {
        return content.font(.custom("NanumSquareNeoTTF-\(family)", fixedSize: size))
            .foregroundColor(color)
    }
}

extension View {
    func nanumSquareNeo(family: NanumSquareNeoFamily, size: CGFloat, color: Color) -> some View {
        return self.modifier(NanumSquareNeoFont(family: family, size: size, color: color))
    }
}

extension UIFont {
    static func nanumSquareNeo(family: NanumSquareNeoFamily, size: CGFloat, color: Color) -> UIFont?{
        let font = UIFont(name: "NanumSquareNeo-\(family)", size: size)
        return font
    }
}

extension Font {
    static func nanumSquareNeo(family: NanumSquareNeoFamily, size: CGFloat, color: Color) -> Font{
        let font = Font.custom("NanumSquareNeo-\(family)", size: size)
        return font
    }
}



```

<br>

## 🐈‍⬛ Git

### 1️⃣ Git branching Strategy

- Origin(main branch)
    - Origin(dev branch)
        - Local(feature branch)

- Branch
    - Main
    - Dev
    - Feature
    - Fix

- 방법
    - 1. Pull the **Dev** branch of the Origin
    - 2. Make a **Feature** branch in the Local area
    - 3. Developed by **Feature** branch
    - 4. Push the **Feature** from Local to Origin
    - 5. Send a pull request from the origin's **Feature** to the Origin's **Dev**
    - 6. In Origin **Dev**, resolve conflict and merge
    - 7. Fetch and rebase Origin **Dev** from Local **Dev**





## Commit 규칙
> 커밋 제목은 최대 50자 입력 </br>
본문은 한 줄 최대 72자 입력 </br>
Commit 메세지 </br>

🪛[chore]: 코드 수정, 내부 파일 수정. </br>
✨[feat]: 새로운 기능 구현. </br>
🎨[style]: 스타일 관련 기능.(코드의 구조/형태 개선) </br>
➕[add]: Feat 이외의 부수적인 코드 추가, 라이브러리 추가 </br>
🔧[file]: 새로운 파일 생성, 삭제 시 </br>
🐛[fix]: 버그, 오류 해결. </br>
🔥[del]: 쓸모없는 코드/파일 삭제. </br>
📝[docs]: README나 WIKI 등의 문서 개정. </br>
💄[mod]: storyboard 파일,UI 수정한 경우. </br>
✏️[correct]: 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다. </br>
🚚[move]: 프로젝트 내 파일이나 코드(리소스)의 이동. </br>
⏪️[rename]: 파일 이름 변경이 있을 때 사용합니다. </br>
⚡️[improve]: 향상이 있을 때 사용합니다. </br>
♻️[refactor]: 전면 수정이 있을 때 사용합니다. </br>
🔀[merge]: 다른브렌치를 merge 할 때 사용합니다. </br>
✅ [test]: 테스트 코드를 작성할 때 사용합니다. </br>

<br>

### Commit Body 규칙
> 제목 끝에 마침표(.) 금지 </br>
한글로 작성 </br>
브랜치 이름 규칙

- `STEP1`, `STEP2`, `STEP3`

<br>

## Git flow
- `main` 브랜 치는 앱 출시 
- `Dev`는 테스트 및 각종 파일 merge
- 각 스텝 뱔로 브런치 생성해서 관리 
