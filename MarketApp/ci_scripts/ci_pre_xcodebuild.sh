#!/bin/sh

#  ci_pre_xcodebuild.sh
#  MarketApp
#
#  Created by 서원지 on 2023/02/22.
#

pod init

# Install CocoaPods if it is not already installed
if ! which pod >/dev/null; then
  echo "CocoaPods not found, installing..."
  sudo gem install cocoapods
fi

# Install dependencies
echo "Installing pods..."

pod install

# Xcode 설정 초기화
xcodebuild -scheme 'MarketApp' clean build-for-testing


# 테스트를 위한 준비 작업 수행
export CODE_SIGN_IDENTITY=""
export CODE_SIGNING_REQUIRED=NO
export CODE_SIGNING_ALLOWED=NO

# Xcodebuild 시뮬레이터 디렉토리 생성
mkdir -p ~/Library/Developer/Xcode/DerivedData/MarketApp-abcdefghijk/Build/Products/Debug-iphonesimulator/

# 캐시 디렉토리 삭제
rm -rf ~/Library/Caches/com.apple.dt.Xcode
