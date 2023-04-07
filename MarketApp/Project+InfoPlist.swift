//
//  Project+InfoPlist.swift
//  MarketAppManifests
//
//  Created by 서원지 on 2023/04/07.
//

import ProjectDescription

let infoPlist: [String: InfoPlist.Value] = [
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
]

