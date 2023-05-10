//
//  CommunityView.swift
//  MarketApp
//
//  Created by 서원지 on 2023/03/19.
//

import SwiftUI

struct CommunityView: View {
    @State private var tex = ""
    
    @State private var likes = 1
    @State private var isTouched = false
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<7) { _ in
                    CommentList()
                    
                }
            }
            .bounce(false)
            .frame(minHeight: UIScreen.screenHeight / 110)
            
            
            
            CommentView()
        }
    }
    
    
        //여기!!
    @ViewBuilder
    private func CommentList() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.colorAsset.lightBlack)
                .frame(width: 360, height: 60)
            VStack {
                HStack {
                    Text("roy님")
                    
                  Spacer()
                        .frame(width: 10)
                    
                    Text("yyyy:mm:dd hh:mm:ss")
                        
                    Spacer()

                }
                .padding(.horizontal, 30)
                .nanumSquareNeo(family: .aLt, size: 10, color: .white)
                
            }
        }
    }
    
        //여기!!
    @ViewBuilder
    private func CommentView() -> some View {
        ZStack {
            HStack {
                TextField("댓글을 입력해주세요", text: $tex, axis: .horizontal)
                    .padding()
                    .background(Color.colorAsset.gray.opacity(0.3))
                    .cornerRadius(10)
                        
                Button(action: {
                    //TODO : 문장 입력 후 완료 버튼을 누르면 CommunityBlock 뷰에 해당 문장이 올라가게끔 설계
                                        //Loading Animation?
                }, label: {
                    ZStack {
                        Rectangle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            }
                        
                        Image(systemName: "paperplane")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.colorAsset.lightBlack)
                    }
                })
            }
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
