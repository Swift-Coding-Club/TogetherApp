//
//  InfoView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/28.
//

import SwiftUI

enum tapInfo : String, CaseIterable {
    case info = "정보"
    case size = "사이즈"
    case review = "리뷰"
    case call = "문의"
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
            case .size:
                Text("사이즈 참고해주세요")
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                    .frame(width: 300, height: 20, alignment: .center)
                Text("발폭 넓으신분 -> 한사이즈 up!")
                    .padding()
            case .review:
                ScrollView(.horizontal, showsIndicators: false) {
                    ForEach(0..<10) { _ in
                        LazyHStack {
                            ForEach(0..<2) { _ in
                                NavigationLink(destination: ProductReviewView()){
                                    VStack(spacing: 5) {
                                        Image("shoes")
                                            .resizable()
                                            .frame(width: 160, height: 200, alignment: .center)
                                        Text("실착용 솔직 한달 후기 입니다")
                                            .font(.system(size: 15, weight: .bold, design: .monospaced))
                                            .frame(width: 160, height: 20, alignment: .leading)
                                            .foregroundColor(.black)
                                        Text("Sky Blue")
                                            .font(.system(size: 13, weight: .medium, design: .monospaced))
                                            .frame(width: 160, height: 20, alignment: .leading)
                                            .foregroundColor(.black)
                                        Text("평발인데 너무편해요 공간도 넉넉해서 걸을때 불편하지 않아요 최고입니다 ㅋㅋ 재구매의사 100%")
                                            .font(.system(size: 13, weight: .medium, design: .default))
                                            .frame(width: 160, height: 50, alignment: .leading)
                                            .foregroundColor(.black)
                                    }
                                    .padding(15)
                                }
                            }
                        }
                    }
                }
            case .call:
                VStack {
                    Text("별도의 커뮤니티를 운영하지 않습니다.")
                    Text("자세한 문의는 여기로 부탁드립니다")
                    Text("02-xxx-xxxx")
                        .padding()
                }.padding()
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
