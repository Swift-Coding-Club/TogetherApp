//
//  InfoViewModel.swift
//  MarketApp
//
//  Created by 홍태희 on 2023/02/14.
//

import SwiftUI

//MARK : 커뮤니티
let dateformat: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY년 M월 d일"
    return formatter
}()

struct CommunityBlock : View {
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

//MARK : 상단탭바
enum tapInfo : String, CaseIterable {
    case info = "상세정보"
    case community = "커뮤니티"
}

struct testView : View {
    
    var tests : tapInfo
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            switch tests {
            case .info:
                ForEach(0..<5) { _ in
                    Text("블랙컬러")
                        .padding()
                    Image("shoes")
                        .resizable()
                        .frame(maxWidth: 350, minHeight: 500)
                }
            case .community:
                ScrollView(showsIndicators: false) {
                    ForEach(0..<7) { _ in
                        CommunityBlock(nickName: "Zero",
                                       comment: "요즘 매종 키츠네 신발 유행인가요? 알려주세요 :)")
                    }
                }
            }
        }
    }
}
