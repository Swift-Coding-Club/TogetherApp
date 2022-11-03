//
//  InfoView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/28.
//

import SwiftUI

struct InfoView: View {
    
    @State private var btnIndex = 0
    let category = ["정보", "사이즈", "후기", "문의"]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(category.indices){ index in
                    Button(action: {
                        //ACTION : (각 인덱스 별) 버튼 클릭시 (그 인덱스에) 맞는 뷰 띄워주기
                    }, label: {
                        Text(category[index])
                            .foregroundColor(.black)
                            .frame(height: 50, alignment: .center)
                            .frame(maxWidth: .infinity)
                    })
                }
            }
        }
    }
    
    //MARK : 정보
    @ViewBuilder
    private func shoeView() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(0..<50) { _ in
                Text("INFO : 신발의 정보가 나오는 뷰입니다.")
                    .padding()
            }
        }
    }
    
    //MARK : 리뷰
    @ViewBuilder
    private func reView() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(0..<50) { _ in
                Text("INFO : 해당 제품의 리뷰가 나오는 뷰입니다.")
                    .padding()
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
