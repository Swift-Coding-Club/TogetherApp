//
//  CommunityView.swift
//  MarketApp
//
//  Created by 홍태희 on 2023/03/02.
//

import SwiftUI
import ExytePopupView

//MARK : 커뮤니티
let dateformat: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY.MM.dd HH:MM:SS"
    return formatter
}()

struct CommunityBlock : View {
    var nickName : String
    var time = Date()
    var comment : String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(maxWidth: 360, minHeight: 70)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1)
                }
                
            VStack(alignment: .leading) {
                HStack {
                    Text("\(nickName)님")
                        .nanumSquareNeo(family: .cBd, size: 18, color: .black)
                    Text("\(time, formatter: dateformat)")
                        .nanumSquareNeo(family: .cBd, size: 15, color: .gray)
                }
                Text("\(comment)")
                    .nanumSquareNeo(family: .cBd, size: 15, color: .black)
            }
        }.padding(.top, 10)
    }
}

struct WriteComments : View {
    @State private var comments = ""
    @State var backPop = false
    
    var body: some View {
        ZStack {
            HStack {
                TextField("댓글을 입력해주세요.", text: $comments)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(20)
                
                Button(action: {
                    //TODO : 문장 입력 후 완료 버튼을 누르면 CommunityBlock 뷰에 해당 문장이 올라가게끔 설계
                    backPop = true
                }, label: {
                    Text("올리기")
                        .frame(width: 50)
                        .nanumSquareNeo(family: .cBd, size: 15, color: .black)
                })
            }
        }//동작안함. ( bp해두고 돌려봤을때는 잘찍힘 )
        .popup(isPresented: $backPop, type: .default, position: .top, animation: .spring(), dragToDismiss: true, closeOnTap: false, closeOnTapOutside: true) {
            VStack {
                Text("서비스 준비중이에요!")
                    .padding(.bottom, 10)
                Text("조금만 기다려주세요~")
            }
            .frame(width: 300, height: 200)
            .background(.black)
            .cornerRadius(10)
            .nanumSquareNeo(family: .cBd, size: 20, color: .white)
        }
    }
}
