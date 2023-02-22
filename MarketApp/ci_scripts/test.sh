#!/bin/sh

#  test.sh
#  MarketApp
#
#  Created by 서원지 on 2023/02/22.
#  

# ci_pre_xcodebuild.sh 파일 실행
source ci_pre_xcodebuild.sh

xcodebuild -scheme 'MarketApp' test -destination "platform=iOS Simulator,name=iPhone 13 Pro Max"
