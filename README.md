# TogetherAPP(MarketAPP)
신발 커뮤니티 앱  
 

## Projects
## 신발 커뮤니티 앱(Affinity) 
🗓 프로젝트 소개 : 신발 커뮤니티 앱 !</br>
🗓 기간 : 2022.08.03 ~   </br>
🗓 팀원: [로이](https://github.com/Roy-wonji), [민](https://github.com/italsehf), [영](https://github.com/Dtzer0), [소낙](https://github.com/choo121600), [리넴](https://github.com/Duckduck1596) </br>



## 디자인
- [피그마디자인](https://www.figma.com/file/zR1dKPOlDJUMRL2PRlUD3A/ios%EA%B0%9C%EB%B0%9C%ED%81%B4%EB%9F%BD%3A%EA%B3%B5%EB%B6%80%EA%B0%80%EB%8B%B5%EC%9D%B4%EB%8B%A4?node-id=0%3A1)


## 앱아이콘  
<img src= "https://i.imgur.com/tSuixnm.png"  width="30%">

##  앱 UI



## Affinity앱은 어떤건가요??

> 신발 커뮤니티 관련 댓글 을 달수 있는 커뮤니티앱이에요
> 신발 사진을 들어가면 댓글을 남길수 있어요 !!


## 시연영상



## 팀원 소개

PM 및 디자인 : [민](https://github.com/italsehf)<br>
IOS 메인 개발: [로이](https://github.com/Roy-wonji)<br>
IOS 개발 및 서버 : [소낙](https://github.com/choo121600)<br>
IOS 개발 및 디자인 : [영](https://github.com/Dtzer0)<br>
IOS 개발 : [리넴](https://github.com/Duckduck1596)<br>
디자이너 : 루비




## 사용한 라이브러리
- `Alamofire` , `Kingfisher` , `SwiftLint`,  `Firebase`

## 사용한 api


## 사용할 협업툴 
- `Notion` , `Figma`

## 디자인 패턴 #
- MVVM 패턴 

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

### 폴더링


## 구현 내용 




## 네트워크 통신

### viewModel 구현 

## 컬러및 폰트 공용 

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

### Commit Body 규칙
> 제목 끝에 마침표(.) 금지 </br>
한글로 작성 </br>
브랜치 이름 규칙

- `STEP1`, `STEP2`, `STEP3`

### Git flow
- `main` 브랜 치는 앱 출시 
- `Dev`는 테스트 및 각종 파일 merge
- 각 스텝 뱔로 브런치 생성해서 관리 








## [fastlane match](https://docs.fastlane.tools/actions/match/)

This repository contains all your certificates and provisioning profiles needed to build and sign your applications. They are encrypted using OpenSSL via a passphrase.

**Important:** Make sure this repository is set to private and only your team members have access to this repo.

Do not modify this file, as it gets overwritten every time you run _match_.

### Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using

```
[sudo] gem install fastlane -NV
```

or alternatively using `brew install fastlane`

### Usage

Navigate to your project folder and run

```
fastlane match appstore
```

```
fastlane match adhoc
```

```
fastlane match development
```

```
fastlane match enterprise
```

For more information open [fastlane match git repo](https://docs.fastlane.tools/actions/match/)

### Content

#### certs

This directory contains all your certificates with their private keys

#### profiles

This directory contains all provisioning profiles

---

For more information open [fastlane match git repo](https://docs.fastlane.tools/actions/match/)
