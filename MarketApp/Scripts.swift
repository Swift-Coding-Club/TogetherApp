//
//  Scripts.swift
//  MarketAppManifests
//
//  Created by 서원지 on 2023/04/07.
//

import ProjectDescription

public extension TargetScript {
    static let FirebaseCrashlyticsScript = TargetScript.pre(script: "${BUILD_DIR%Build/*}SourcePackages/checkouts/firebase-ios-sdk/Crashlytics/run", name: "FirebaseCrashlyticsScript", inputPaths: ["$(SRCROOT)/$(BUILT_PRODUCTS_DIR)/Firebase/GoogleService-Info.plist", "${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}/Contents/Resources/DWARF/${TARGET_NAME}", "$(SRCROOT)/$(BUILT_PRODUCTS_DIR)/$(INFOPLIST_PATH)", "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/Firebase/GoogleService-Info.plist -p ios ${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}"], basedOnDependencyAnalysis: false)

}
