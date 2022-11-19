//
//  ContentView.swift
//  dsfas
//
//  Created by 현돌이 on 2022/11/05.
//

import SwiftUI

enum CateGoryType: String {
    case top, bottom, outer, shoes, acc, etc
    
    var CateGoryName: String {
        switch self {
        case .top:
            return "상의"
        case .bottom:
            return "하의"
        case .outer:
            return "아우터"
        case .shoes:
            return "슈즈"
        case .acc:
            return "악세서리"
        case .etc:
            return "기타"
            
        }
    }
}

struct ListView: View {
    @State private var showingAlert = false
    
    private let categoryData : [CateGoryType] = [.top, .bottom, .outer, .shoes, .acc, .etc]
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .trailing)
                    .padding(.leading)
                
                Spacer()
                
                Text("App Name")
                    .font(.system(size: 33, weight: .bold))
                    .padding(.trailing, 28)
                
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .trailing)
                Image(systemName: "cart")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .trailing)
                    .padding(.trailing)
                
            }
            
            NavigationView {
                TabView {
                    ScrollView(.vertical, showsIndicators: true) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(categoryData, id: \.self) {
                                    item in
                                    Button {
                                        
                                    } label: {
                                        Text(item.CateGoryName)
                                            .font(.system(size: 13, weight: .bold))
                                            .frame(width: 70, height: 40)
                                            .background(.black)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                            .padding(.leading, 5)
                                    }
                                }
                            }
                        }
                        ForEach(0..<5) { _ in
                            LazyHStack {
                                ForEach(0..<2) { _ in
                                    NavigationLink(destination: ListView()){
                                        LazyVStack {
                                            VStack{
                                                ZStack{
                                                    Image(systemName: "tshirt")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 150, height: 200, alignment: .trailing)
                                                        .background(.gray)
                                                        .foregroundColor(.black)
                                                    Button{
                                                        
                                                    }label: {
                                                        Image(systemName: "heart.fill")
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 60)
                                                            .foregroundColor(.white)
                                                            .padding(.top, 170)
                                                            .padding(.leading, 100)
                                                    }
                                                }
                                                Text("Maison Kitsune")
                                                    .font(.system(size: 12, weight: .bold, design: .rounded))
                                                    .frame(width: 160, alignment: .leading)
                                                    .foregroundColor(.black)
                                                Text("더블 폭스 패치 스니커즈")
                                                    .font(.system(size: 13, weight: .medium, design: .default))
                                                    .frame(width: 160, alignment: .leading)
                                                    .foregroundColor(.black)
                                                Text("281,000원")
                                                    .font(.system(size: 12, weight: .bold, design: .rounded))
                                                    .frame(width: 160,  alignment: .leading)
                                                    .foregroundColor(.black)
                                            }
                                            
                                            .padding(20)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("Home")
                    }
                    // 리스트 관련 탭 설정
                    Text("List Tab")
                        .tabItem {
                            Image(systemName: "2.square.fill")
                            Text("List")
                        }
                    // 즐겨찾기 관련 탭 설정
                    Text("Favorite Tab")
                        .tabItem {
                            Image(systemName: "3.square.fill")
                            Text("Favorite")
                        }
                    // 프로필 관련 탭 설정
                    Text("Profile Tab")
                        .tabItem {
                            Image(systemName: "4.square.fill")
                            Text("Profile")
                        }
                }
            }
        }
    }
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
