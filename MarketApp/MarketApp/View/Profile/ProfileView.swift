//
//  ProfileView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI
import ExytePopupView

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: SignUPViewModel
    
    @State private var show: Bool = false
    @State private var showTermsView: Bool = false
    @State private var showConnatView: Bool = false
    @State private var showDeveloperView: Bool = false
    @State private var showLogoutPOPUPView: Bool = false
    @State private var showWithDrawPOPUPView: Bool = false
    
    var body: some View {
        VStack {
            profileHeader()
            
            profileSettingView()
            
            profileLogOutTypeView()
            
            Spacer()
        }
        
        .fullScreenCover(isPresented: $viewModel.loginStatus) {
            LoginView()
        }
    }
    
    @ViewBuilder
    private func profileHeader() -> some View {
        HStack{
         Rectangle()
                .frame(width: UIScreen.screenWidth, height: 200)
                .overlay {
                    VStack(alignment: .leading, spacing: .zero){
                        Spacer()
                            .frame(height: 40)
                        
                        HStack{
                            
                            Circle()
                                .fill(.gray)
                                .frame(width: 75, height: 75)
                            
                            Spacer()
                                .frame(width: 20)
                            
                            Text("닉네임")
                                .nanumSquareNeo(family: .eHv, size: 30, color: .white)
                            
                            Spacer()
                        }
                        
                        Spacer()
                            .frame(height: 10)
                        
                        HStack(alignment: .center){
                         Spacer()
                            Text("작성댓글")
                                .nanumSquareNeo(family: .eHv, size: 24, color: .white)
                            
                            Spacer()
                                .frame(width: 106)
                            
                            Text("좋아요")
                                .nanumSquareNeo(family: .eHv, size: 24, color: .white)
                            
                            Spacer()
                        }
                        
                        
                        
                        Spacer()
                        
                    }
                }
            
        }
    }
    
    @ViewBuilder
    private func profileSettingView() -> some View {
        Section {
            ForEach(ProfileSettingType.allCases, id: \.description) { item  in
                switch item {
                case .termsPolices:
                    ListArrowView(listTitle: item.description, showView: $showTermsView)
                case .connatAS:
                    ListArrowView(listTitle: item.description, showView: $showConnatView)
                case .developer:
                    ListArrowView(listTitle: item.description, showView: $showDeveloperView)
                }
            }
            Spacer()
                .frame(height: 60)
        }
    }
    
    @ViewBuilder
    private func profileLogOutTypeView() -> some View {
        Section {
            ForEach(ProfileLogoutType.allCases, id: \.description) { item in

                switch item {
                case .logout:
                    ListtLoginView(listTitle: item.description, showPOPUPView: $showLogoutPOPUPView, color: Color.colorAsset.mainColor)

                case  .withdrawal:
                    ListtLoginView(listTitle: item.description, showPOPUPView: $showWithDrawPOPUPView, color: Color.red.opacity(0.5))
                }
                
            }
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(dev.signUPViewModel)
    }
}
