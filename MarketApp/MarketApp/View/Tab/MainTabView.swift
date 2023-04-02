//
//  MainContentView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var loginViewModel: SignUPViewModel = SignUPViewModel()
    
    @State var showView: Bool = false
    @State private var selectView: Int = 0
    @State private var selectOldView: Int = 1
    
    let numTabs = 3
    let minDragTranslationForSwipe: CGFloat = 50
    
    var body: some View {
        NavigationStack(root: {
            ZStack{
                TabView(selection: $selectView) {
                    HomeView()
                        .tabItem{
                            VStack{
                                Image(systemName: "house.fill")
                                Text("Home")
                                    .nanumSquareNeo(family: .cBd, size: 15, color: Color.fontColor.fontColor)
                            }
                        }
                        .tag(0)
                    //                .highPriorityGesture(DragGesture().onEnded({
                    //                    self.handleSwipe(translation:  $0.translation.width)
                    //                }))
                    
                    SearchView()
                        .tabItem{
                            VStack{
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                                    .nanumSquareNeo(family: .cBd, size: 15, color: Color.fontColor.fontColor)
                            }
                        }
                        .tag(1)
                    //                .highPriorityGesture(DragGesture().onEnded({
                    //                    self.handleSwipe(translation:  $0.translation.width)
                    //                }))
                    
                    ProfileView()
                        .environmentObject(loginViewModel)
                        .tabItem{
                            VStack{
                                Image(systemName: "person.crop.circle")
                                Text("Profile")
                                    .nanumSquareNeo(family: .cBd, size: 15, color: Color.fontColor.fontColor)
                            }
                        }
                        .tag(2)
        //                .highPriorityGesture(DragGesture().onEnded({
        //                    self.handleSwipe(translation:  $0.translation.width)
        //                }))
                }
            }
        })
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            UITabBar.appearance().tintColor = UIColor(Color.colorAsset.blueGray)
            UITabBar.appearance().unselectedItemTintColor = UIColor(Color.fontColor.secondaryTextColor)
        }
        .onChange(of: selectView, perform: {
            if 2 == selectView {
                if loginViewModel.userSession == nil  {
                    self.selectView = self.selectOldView
                    self.showView = true
                }
            } else if showView == false {
                self.selectOldView = $0
            } else if loginViewModel.loginStatus == false || loginViewModel.deleteUser == true {
                self.selectOldView = $0
                self.showView = true
            }
        })
        .onChange(of: loginViewModel.userSession, perform: { newValue in
            if newValue == nil && selectView == 2 {
                selectView = selectOldView
            }
        })
        .accentColor(Color.colorAsset.blueGray)
        .fullScreenCover(isPresented: $showView){
            LoginView(viewModel: loginViewModel)
                .transition(.move(edge: .bottom))
        }
    }
    //MARK: - 드래그 했을때 뷰 변경
    private func handleSwipe(translation: CGFloat) {
        if translation > minDragTranslationForSwipe && selectView > 0 {
            selectView -= 1
        } else  if translation < -minDragTranslationForSwipe && selectView < numTabs-1 {
            selectView += 1
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainTabView()
                .environmentObject(dev.signUPViewModel)
        }
    }
}
