//
//  MainContentView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI
import ModalView

struct MainContentView: View {
    @StateObject var loginViewModel  = SignUPViewModel()
    
    @State var showView: Bool = false
    @State private var selectView: Int = 1
    @State private var selectOldView: Int = 1
    
    var body: some View {
        TabView(selection: $selectView) {
            MainView()
                .tabItem{
                    VStack{
                        Image(systemName: "house.fill")
                        Text("Home")
                            .nanumSquareNeo(family: .cBd, size: 15, color: Color.fontColor.fontColor)
                    }
                }
                .tag(1)
            
            SearchedView()
                .tabItem{
                    VStack{
                        Image(systemName: "heart.fill")
                        Text("Favorite")
                            .nanumSquareNeo(family: .cBd, size: 15, color: Color.fontColor.fontColor)
                    }
                }
                .tag(2)
            
            ProfileView()
                .tabItem{
                    VStack{
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                            .nanumSquareNeo(family: .cBd, size: 15, color: Color.fontColor.fontColor)
                    }
                }
                .tag(3)
        }
        .onAppear{
            self.showView = false
            UITabBar.appearance().tintColor = UIColor(Color.colorAsset.mauve2)
            UITabBar.appearance().unselectedItemTintColor = UIColor(Color.fontColor.secondaryTextColor)
        }
        .onChange(of: selectView, perform: {
            if 3 == selectView {
                if loginViewModel.loginStatus == false{
                    self.selectView = self.selectOldView
                    self.showView = true
                } else {
                    ProfileView()
                }
            } else if showView == false {
                self.selectOldView = $0
            }
        })
        .accentColor(Color.colorAsset.mainColor)
        .navigationTitle("APP NAME")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: leadingNavigationTrallingView())
        .navigationBarItems(leading: notiNavigationView())
        .fullScreenCover(isPresented: $showView){
            NavigationView {
                LoginView(viewModel: loginViewModel)
                    .transition(.move(edge: .bottom))
            }
        }
    }

    
    //MARK: - 검색 뷰 &  장바구니 뷰
    @ViewBuilder
    private func leadingNavigationTrallingView() -> some View {
        HStack{
            ForEach(MainNavigaionItem.allCases, id: \.description) { item in
                if item == .search {
                    NavigationLink(destination: SearchedView()){
                        Image(systemName: item.image).resizable()
                            .frame(width: 25, height: 25, alignment: .trailing)
                            .foregroundColor(.black)
                    }
                }
//                else if item == .cart {
//                    NavigationLink(destination: CartView()){
//                        Image(systemName: item.image ).resizable()
//                            .frame(width: 25, height: 25, alignment: .trailing)
//                            .foregroundColor(.black)
//                    }
//                }
            }
        }
    }
    //MARK:  - 알림 뷰
    @ViewBuilder
    private func notiNavigationView() -> some View {
        NavigationLink(destination: NotiView()){
            Image(systemName: "bell").resizable()
                .frame(width: 25, height: 25, alignment: .trailing)
                .foregroundColor(.black)
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
            .previewDevice("iPhone 12")
    }
}
