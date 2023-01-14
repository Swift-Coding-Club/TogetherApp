//
//  PreviewProvider.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/11.
//

import SwiftUI

class DevloperPreview {
    static let instance = DevloperPreview( )
    init () { }
    
    let signUPViewModel = SignUPViewModel()
    
}

extension PreviewProvider {
    
    static var dev: DevloperPreview {
        return DevloperPreview.instance
    }
}
