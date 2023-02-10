//
//  InfoView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/28.
//

import SwiftUI

enum tapInfo : String, CaseIterable {
    case info = "상세정보"
    case community = "커뮤니티"
}

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

struct InfoView: View {

    @State private var selectedPicker: tapInfo = .info
    @Namespace private var animation
    
    var body: some View {
        VStack {
            animate()
            testView(tests: selectedPicker)
        }
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(tapInfo.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .font(.title3)
                        .frame(maxWidth: .infinity/4, minHeight: 50)
                        .foregroundColor(selectedPicker == item ? .black : .gray)

                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(.black)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "info", in: animation)
                    }
                    
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }
    }
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

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
