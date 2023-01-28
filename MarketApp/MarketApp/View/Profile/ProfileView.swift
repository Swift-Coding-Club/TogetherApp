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
    
    var body: some View {
        
        VStack {
            Text("로그아웃")
                .nanumSquareNeo(family: .cBd, size: 20, color: .black)
                .onTapGesture {
                    viewModel.signOut()
                    viewModel.loginStatus = false
                }
        }
        .fullScreenCover(isPresented: $viewModel.loginStatus) {
            LoginView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(dev.signUPViewModel)
    }
}
