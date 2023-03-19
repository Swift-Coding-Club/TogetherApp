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
    let shoesData = [ShoeData(shoesId: 1, brandName: "Nike", productName: "Nike Air Force 1 '07 Low White", transName: "나이키 에어포스 1 '07 로우 화이트", image: "https://kream-phinf.pstatic.net/MjAyMjA2MTVfMjYw/MDAxNjU1MjgzNjk2Mzk3.gh8n5rs7p-pWVqzIhNh7yj_KdyjLFBeJr9QbsDumoFEg.KdvPfvgBYmjm7MKKhcbIEQIP6FGeuof_GnmcDUgrvyAg.PNG/a_baa1ccea3726495badba419dfede63f9.png?type=m", price: "128,000"), ShoeData(shoesId: 1, brandName: "Nike", productName: "Nike Air Force 1 '07 Low White", transName: "나이키 에어포스 1 '07 로우 화이트", image: "https://kream-phinf.pstatic.net/MjAyMjA2MTVfMjYw/MDAxNjU1MjgzNjk2Mzk3.gh8n5rs7p-pWVqzIhNh7yj_KdyjLFBeJr9QbsDumoFEg.KdvPfvgBYmjm7MKKhcbIEQIP6FGeuof_GnmcDUgrvyAg.PNG/a_baa1ccea3726495badba419dfede63f9.png?type=m", price: "128,000"),]
    let shoesDatas = ShoeData(shoesId: 1, brandName: "Nike", productName: "Nike Air Force 1 '07 Low White", transName: "나이키 에어포스 1 '07 로우 화이트", image: "https://kream-phinf.pstatic.net/MjAyMjA2MTVfMjYw/MDAxNjU1MjgzNjk2Mzk3.gh8n5rs7p-pWVqzIhNh7yj_KdyjLFBeJr9QbsDumoFEg.KdvPfvgBYmjm7MKKhcbIEQIP6FGeuof_GnmcDUgrvyAg.PNG/a_baa1ccea3726495badba419dfede63f9.png?type=m", price: "128,000")
    
    let shoesDetailData = [ShoesDetailData(shoesId: 2, brandName: "Nike", productName: "Nike Dunk Low Retro Grey Fog", transName: "나이키 덩크 로우 레트로 그레이 포그", price: "130,000", productImg: ["https://kream-phinf.pstatic.net/MjAyMTA5MDlfMTM2/MDAxNjMxMTY4NDgxNjYy.zbjY9wciksaYT7sUz-OdfVfMijT4zlN3ZrP1_FKTIkAg.q1tp-NTfS052i0hTqbYKf1mhtxZZBWEcEm9LUCfevhkg.PNG/a_bd87be02eddb460798690f5d082217c5.png?type=l", "https://kream-phinf.pstatic.net/MjAyMTA5MDlfMTE5/MDAxNjMxMTY4NDg0Mzk1.h6CHbDt3cSsoyGumXlzNmhTa8iNJvWcIzhzimNzNF2Ig.Gh0liKYzQEZ-r3l3gFAX0DBPT9bt2FuywdbiPK1-LJ0g.PNG/a_32465a09d3214e2e8cba85d1bc62ee04.png?type=l", "https://kream-phinf.pstatic.net/MjAyMTA5MDlfMTU5/MDAxNjMxMTY4NDg2Nzg3.Kf0RTLiVjQ2dxE8Z-ZgFPWDQGhJiQKt-LjVvrCo5NS4g.VPstVD7BiTciaEAwad02Z2i85fJvls4-zKUkaQHyElUg.PNG/a_dca56f9e768f4b028640d578f4703575.png?type=l"])]
}

extension PreviewProvider {
    
    static var dev: DevloperPreview {
        return DevloperPreview.instance
    }
}
