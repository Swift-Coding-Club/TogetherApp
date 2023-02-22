#!/bin/sh

#  ci_post_xcodebuild.sh
#  MarketApp
#
#  Created by 서원지 on 2023/02/22.
#  
#brew install cocoapods

brew install cocoapods
 
pod install


# 빌드 결과 파일 복사
#cp -R ./build/Debug-iphonesimulator/MarketApp.app ~/Desktop/
