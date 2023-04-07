import ProjectDescription

let projectName = "MarketApp"
let bundleID = "com.shoping.MarketApps"
let iOSTargetVersion = "16.0"
let organizationName: String = "Wonji Suh"
let version = "1.0.2"
let buildNumber = "85"

let project = Project(
  name: projectName,
  organizationName: organizationName,
  packages: [], // SPM 사용 시 입력 ".package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.5.0")"
// configuration으로 관리할 경우 아래처럼 path정보 입력
  settings: .settings(base: ["CODE_SIGN_STYLE": "Automatic", "UISupportedInterfaceOrientations~ipad": [],"UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"], "PRODUCT_NAME": "Affinity",
                             "CFBundleDisplayName": "Affinity",
                             "LSApplicationCategoryType": "public.app-category.LifeStyle"
                            ]),
  
  targets: [
    Target(name: projectName,
           platform: .iOS,
           product: .app, // Static Framework, Dynamic Framework
           bundleId: bundleID,
           deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: [.iphone]),
           infoPlist: .extendingDefault(with: [
            "CFBundleShortVersionString": .string(version),
            "CFBundleVersion": .string(version),
            "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"],
            "UISupportedInterfaceOrientations~ipad": [],
            "LSApplicationCategoryType": "public.app-category.LifeStyle",
            "CFBundleURLTypes": [
                [
                    "CFBundleTypeRole": "Editor",
                    "CFBundleURLName": "googleInfo-dev",
                    "CFBundleURLSchemes": [
                        "com.googleusercontent.apps.1084704218474-4q2d9rmvugrigvhimcvsj6sqp5du53u7"
                    ]
                ],
                [
                    "CFBundleTypeRole": "Editor",
                    "CFBundleURLName": "googleRealse",
                    "CFBundleURLSchemes": [
                        "com.googleusercontent.apps.673131017055-j9iahve9q788hkdf4mj1silt6s68bn76"
                    ]
                ]
            ],
            "ITSAppUsesNonExemptEncryption": false,
            "Localizationnativedevelopmentregion": "Korea",
            "NSAppTransportSecurity": [
                "NSAllowsArbitraryLoads": true
            ],
            "UIAppFonts": [
                "NanumSquareNeo-aLt.ttf",
                "NanumSquareNeo-bRg.ttf",
                "NanumSquareNeo-cBd.ttf",
                "NanumSquareNeo-dEb.ttf",
                "NanumSquareNeo-eHv.ttf"
            ]
        ]),
           sources: ["\(projectName)/Sources/**" ],
           resources: ["\(projectName)/Resources/**",
                       "\(projectName)/Sources/Firebase/**",
                       "\(projectName)/Sources/**"
                      ],
           entitlements: nil,
           scripts: [.pre(script: "\"${BUILD_DIR%Build/*}SourcePackages/checkouts/firebase-ios-sdk/Crashlytics/run\"", name: "FirebaseCrashlyticsScript", inputPaths: ["$(SRCROOT)/$(BUILT_PRODUCTS_DIR)/Firebase/GoogleService-Info.plist", "${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}/Contents/Resources/DWARF/${TARGET_NAME}", "$(SRCROOT)/$(BUILT_PRODUCTS_DIR)/$(INFOPLIST_PATH)", "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/Firebase/GoogleService-Info.plist -p ios ${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}"], basedOnDependencyAnalysis: false)],
           dependencies: [],
           
           additionalFiles: [FileElement.folderReference(path: "./\(projectName)/Sources/**"),FileElement.folderReference(path: "./\(projectName)/Resources/**") ]
           
// tuist generate할 경우 pod install이 자동으로 실행
          ),
    Target(name: "\(projectName)Tests",
           platform: .iOS,
           product: .unitTests, // Static Framework, Dynamic Framework
           bundleId: bundleID,
           deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: [.iphone]),
           infoPlist: .default,
           sources: ["\(projectName)Tests/Sources/**"],
           resources: [],
           dependencies: [] // tuist generate할 경우 pod install이 자동으로 실행
          ),
    
    Target(name: "\(projectName)UITests",
           platform: .iOS,
           product: .uiTests, // Static Framework, Dynamic Framework
           bundleId: bundleID,
           deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: [.iphone]),
           infoPlist: .default,
           sources: ["\(projectName)UITests/Sources/**"],
           resources: [],
           dependencies: [] // tuist generate할 경우 pod install이 자동으로 실행
          )
   
  ]
  
//  schemes: [
//    Scheme(name: "\(projectName)Debug"),
//    Scheme(name: "\(projectName)Release")
//  ]
//  fileHeaderTemplate: .file(.relativeToCurrentFile("\(projectName)/Sources/**"))
)


