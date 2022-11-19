//
//  InfoView.swift
//  dsfas
//
//  Created by 현돌이 on 2022/11/05.
//

import SwiftUI

struct InfoView: View {
    var tabBarOptions: [String] = ["정보", "사이즈", "후기", "문의"]
    var body: some View {
        
        VStack{
            HStack{
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 20, height: 30, alignment: .trailing)
                    .padding(.leading)
                
                Spacer()
                
                Text("App Name")
                    .font(.system(size: 33, weight: .bold))
                    .padding(.trailing, 28)
                
                Image(systemName: "arrow.up.to.line")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .trailing)
                Image(systemName: "cart")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .trailing)
                    .padding(.trailing)
            }
            .padding(.bottom, 30)
            
            Image(systemName: "tshirt")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, minHeight:400)
                .background(.gray)
            
            HStack{
                VStack{
                    Text("Maison Kitsune")
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .frame(width: 300, height: 20, alignment: .leading)
                    Text("더블 폭스 패치 스니커즈")
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .frame(width: 300, height: 20, alignment: .leading)
                    Text("281,000원")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .frame(width: 300, height: 20, alignment: .leading)
                }
                VStack{
                    Image(systemName: "star.fill").resizable()
                        .frame(width: 35, height: 35, alignment: .center)
                        .foregroundColor(.yellow)
                    Text("4.5")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                }
            }
            ScrollView(.horizontal){
                HStack{
                    ForEach(tabBarOptions.indices, id: \.self) { index in
                        let title = tabBarOptions[index]
                        Text(title)
                            .frame(alignment:.center)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.gray)
                            .padding(.leading, 40)
                    }
                    
                }
            }
            HStack {
                Button{
                    
                } label: {
                    ZStack{
                        Text("")
                            .frame(width: 50, height: 50)
                            .background(.gray)
                            .cornerRadius(15)
                        
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 30, height: 30)
                    }
                }
                .padding(.trailing, 10)
                
                Button{
                    
                } label: {
                    Text("구매")
                        .font(.system(size: 22, weight: .medium, design: .default))
                        .frame(width: 280, height: 50)
                        .padding(.leading, 10)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
            }
            .padding(.top, 100)
        }
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
