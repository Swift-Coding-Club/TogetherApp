//
//  InfoView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/28.
//

import SwiftUI

//MARK : 상단탭바
enum tapInfo : String, CaseIterable {
    case info = "상세정보"
    case community = "커뮤니티"
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
        switch tests {
        case .info:
            ScrollView(showsIndicators: false) {
                ForEach(0..<5) { _ in
                    Text("블랙컬러")
                        .padding()
                    Image("shoes")
                        .resizable()
                        .frame(maxWidth: 350, minHeight: 500)
                }

            }
        case .community:
            VStack {
                ScrollView(showsIndicators: false) {
                    ForEach(0..<10) { _ in
                        CommunityBlock(nickName: "Zero",
                                        comment: "요즘 매종 키츠네 신발이 유행인가요? 알려주세요 :)")
                    }
                }
                WriteComments()
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
