#!/bin/sh

#  ci_post_xcodebuild.sh
#  MarketApp
#
#  Created by 서원지 on 2023/02/22.
#  
#brew install cocoapods

brew install cocoapods
 
 pod init
 
 pod install
 
if [ -f "Podfile" ]; then
    echo "Installing CocoaPods..."
    pod install --repo-update
    echo "Building project with CocoaPods..."
    xcodebuild -workspace 'MarketApp.xcworkspace' -scheme 'MarketApp' -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 14,OS=16.0' clean build test
else
    echo "No Podfile found. Skipping CocoaPods installation and building project..."
    xcodebuild -workspace 'MarketApp.xcworkspace' -scheme 'MarketApp' -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 14,OS=16.0' clean build test
fi

# 빌드 결과 파일 복사
cp -R ./build/Debug-iphonesimulator/MarketApp.app ~/Desktop/

