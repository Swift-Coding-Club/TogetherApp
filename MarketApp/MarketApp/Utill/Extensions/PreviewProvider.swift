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
    let shoesData = ShoeResponse(data: [ShoeData(shoesId : 1, brandName: .nike, productName: "Nike Air Force 1 '07 Low White", transName: "나이키 에어포스 1 '07 로우 화이트", image: "https://kream-phinf.pstatic.net/MjAyMjA2MTVfMjYw/MDAxNjU1MjgzNjk2Mzk3.gh8n5rs7p-pWVqzIhNh7yj_KdyjLFBeJr9QbsDumoFEg.KdvPfvgBYmjm7MKKhcbIEQIP6FGeuof_GnmcDUgrvyAg.PNG/a_baa1ccea3726495badba419dfede63f9.png?type=m", price: "128,000")])
    
//    ShoeResponse(code: "00", message: "success", data: [ShoeData(shoesId : 1, brandName: .nike, productName: "Nike Air Force 1 '07 Low White", transName: "나이키 에어포스 1 '07 로우 화이트", image: "https://kream-phinf.pstatic.net/MjAyMjA2MTVfMjYw/MDAxNjU1MjgzNjk2Mzk3.gh8n5rs7p-pWVqzIhNh7yj_KdyjLFBeJr9QbsDumoFEg.KdvPfvgBYmjm7MKKhcbIEQIP6FGeuof_GnmcDUgrvyAg.PNG/a_baa1ccea3726495badba419dfede63f9.png?type=m", price: "128,000")])
}

extension PreviewProvider {
    
    static var dev: DevloperPreview {
        return DevloperPreview.instance
    }
}
