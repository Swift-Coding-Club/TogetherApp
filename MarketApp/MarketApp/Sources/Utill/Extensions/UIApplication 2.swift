//
//  UIApplication.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/09.
//

import SwiftUI

extension UIApplication {
    //MARK:  - 키보드에서 end 하면  키보드 내리기
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
