//
//  ProfileView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewmodel: SignUPViewModel = SignUPViewModel()
    var body: some View {
        Button {
            viewmodel.signOut()
        } label: {
            Text("로그아웃")
                .nanumSquareNeo(family: .cBd, size: 20, color: .black)
        }
//        .fullScreenCover(isPresented: $viewmodel.log_Status) {
//            LoginView(viewModel: viewmodel)
//        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
