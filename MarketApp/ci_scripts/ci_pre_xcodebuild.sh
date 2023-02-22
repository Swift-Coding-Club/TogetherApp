#!/bin/sh

#  ci_pre_xcodebuild.sh
#  MarketApp
#
#  Created by 서원지 on 2023/02/22.
#  
brew install cocoapods
brew install swiftlint
pod install

# Xcode 설정 초기화
xcodebuild -resolvePackageDependencies -allowProvisioningUpdates -allowPrerelease
xcodebuild -scheme 'MarketApp' clean build-for-testing


# 테스트를 위한 준비 작업 수행
export CODE_SIGN_IDENTITY=""
export CODE_SIGNING_REQUIRED=NO
export CODE_SIGNING_ALLOWED=NO

