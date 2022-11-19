//
//  MainView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI


struct MainView: View {
    private let categoryData : [CateGoryType] = [.top, .bottom, .outer, .shoes, .acc, .etc]
    var body: some View {
        NavigationView {
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
            Image(systemName: "tshirt").resizable().frame(width: 390,height: 227, alignment: .center).background(.gray)
            
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
                                    NavigationLink(destination: MainView()){
                                        LazyVStack {
                                            VStack{
                                                ZStack{
                                                    Image(systemName: "tshirt")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 150, height: 200, alignment: .trailing)
                                                        .background(.gray)
                                                        .foregroundColor(.black)
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
                        Text("Home")
                    }
                    // 리스트 관련 탭 설정
                    Text("List Tab")
                        .tabItem {
                            Text("List")
                        }
                    // 즐겨찾기 관련 탭 설정
                    Text("Favorite Tab")
                        .tabItem {
                            Text("Favorite")
                        }
                    // 프로필 관련 탭 설정
                    Text("Profile Tab")
                        .tabItem {
                            Text("Profile")
                        }
                }
                
            }
        }
    }
}
            
            struct MainView_Previews: PreviewProvider {
                static var previews: some View {
                    MainView()
                }
            }
            
