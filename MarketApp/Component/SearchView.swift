//
//  SearchView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct SearchView: View {
    @State private var isRemoved = false
    @State private var recentKeyword = ["나이키", "아디다스", "빈폴", "메종키츠네", "샤넬", "구찌"]
    
    var body: some View {
        VStack {
            HStack {
                Text("최근 검색어")
                    .frame(width: 200, height: 30, alignment: .leading)
                    .font(.system(size: 17, weight: .semibold))
                
                Button(action: {
                    isRemoved.toggle()
                }, label: {
                    Text("기록 삭제")
                        .frame(width: 140, height: 30, alignment: .trailing)
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.gray)
                })
                .alert(Text("최근 검색어 삭제"), isPresented: $isRemoved, actions: {
                    Button("확인", role: .destructive) {
                        recentKeyword.removeAll()
                    }
                    
                    Button("취소", role: .cancel) {
                        
                    }
                }, message: {
                    Text("삭제하시겠습니까?")
                })
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(recentKeyword.indices, id: \.self) { search in
                        Button(action: {
                            
                        }, label: {
                            Text(recentKeyword[search])
                                .frame(width: 100, height: 30, alignment: .center)
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                                .background(.black)
                                .cornerRadius(20)
                        })
                    }
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
