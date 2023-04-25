//
//  CommunityView.swift
//  MarketApp
//
//  Created by 서원지 on 2023/03/19.
//

import SwiftUI

struct CommunityView: View {
    var nickName : String
    var time = Date()
    var comment : String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .frame(maxWidth: 360, minHeight: 60)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("\(nickName)님")
                        .foregroundColor(.white) //커스텀컴포넌트로 변경예정
                    Text("\(time, formatter: dateformat)")
                        .foregroundColor(.gray)
                }
                Text("\(comment)")
                    .foregroundColor(.white) //커스텀컴포넌트로 변경예정
            }
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView(nickName: "Zero", comment: "요즘 매종 키츠네 신발 유행인가요? 알려주세요 :)")
    }
}
