//
//  ProfileView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI
import PopupView
import Kingfisher
import Photos

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: SignUPViewModel
    @StateObject var profileViewModel = ProfileViewModel()
    
    @State private var showTermsView: Bool = false
    @State private var showConnatView: Bool = false
    @State private var showDeveloperView: Bool = false
    @State private var showLogoutPOPUPView: Bool = false
    @State private var showWithDrawPOPUPView: Bool = false
    @State private var showImagePicker = false
    @State private var deniedAlbum = false
    @State private var notDeterminedAlbum = false
    @State private var editProfileName: Bool = false
    @State private var showTermsPolicesView: Bool = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                editProfileNameView()
                
                profileHeader()
                
                profileSettingView()
                
                profileLogOutTypeView()
                
                Spacer()
            }
        }
        .onAppear {
            profileViewModel.getUserInformation()
        }
        //MARK: - 로그아웃 후
        .fullScreenCover(isPresented: $viewModel.loginStatus) {
            LoginView()
        }
        .navigationDestination(isPresented: $editProfileName) {
            ProfileNickNameView()
        }
        
        .navigationDestination(isPresented: $showTermsPolicesView, destination: {
            WebViews(url: AffinityAPI.TermsPolicesUrl)
        })
        //MARK: - 팝업 관련
        .popup(isPresented: $showLogoutPOPUPView, view: {
            SignOutPOPUPView(title: "로그아웃 하시겠어요", message: "로그아웃 하셔도 Affinity는 유저님을 기다립니다") {
                viewModel.signOut()
            }
        }, customize: { popup in
            popup
                .type(.default)
                .position(.bottom)
                .animation(.spring())
                .autohideIn(2)
                .closeOnTap(true)
                .closeOnTapOutside(true)
        })
        
        .popup(isPresented: $showWithDrawPOPUPView, view: {
            withDrawPOPUPView(title: "회원탈퇴", message: "진짜 회원 탈퇴를 하시겠어요 ??") {
                viewModel.withdrawUser()
                viewModel.loginStatus = true
            }
        }, customize: { popup in
            popup
                .type(.default)
                .position(.bottom)
                .animation(.spring())
                .autohideIn(2)
                .closeOnTap(true)
                .closeOnTapOutside(true)
        })
        
        .popup(isPresented: $deniedAlbum, view: {
            POPUPViews(title: "사진 접근 허용 불가", message: "사진 접근 허용 불가", cancelTitle: "취소", confiremTitle: "확인", color: Color.colorAsset.blueGray)
        }, customize: { popup in
            popup
                .type(.default)
                .position(.bottom)
                .animation(.spring())
                .autohideIn(2)
                .closeOnTap(true)
                .closeOnTapOutside(true)
        })
        
    }
    
    @ViewBuilder
    private func editProfileNameView() -> some View {
        HStack {
            
            Spacer()
            
            Image(systemName: "square.and.pencil")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.colorAsset.lightBlack)
                .onTapGesture {
                    editProfileName = true
                }
        }
        .padding(.horizontal)
        
        Spacer()
            .frame(height: 15)
    }
    
    
    @ViewBuilder
     private func profileHeader() -> some View {
        HStack{
            Rectangle()
                .frame(width: UIScreen.screenWidth, height: 200)
//                .edgesIgnoringSafeArea(.top)
                .overlay {
                    VStack(alignment: .leading, spacing: .zero){
                        Spacer()
                            .frame(height: 40)
                        
                        HStack{
                            
                            VStack(spacing: .zero){
                                
                                Spacer()
                                    .frame(height: 10)
                                
                                imageEditView()
                            }
                            
                            Spacer()
                                .frame(width: 20)
                            
                            Text(profileViewModel.userNickName ?? "닉네임")
                                .nanumSquareNeo(family: .eHv, size: 30, color: Color.colorAsset.white)
                            
                            Spacer()
                        }
                        
                        Spacer()
                            .frame(height: 20)
                        
                        HStack(alignment: .center){
                            
                            Spacer()
                            
                            Text("작성댓글")
                                .nanumSquareNeo(family: .eHv, size: 24, color: Color.colorAsset.white)
                            
                            Spacer()
                                .frame(width: 120)
                            
                            Text("좋아요")
                                .nanumSquareNeo(family: .eHv, size: 24, color: Color.colorAsset.white)
                            
                            Spacer()
                        }

                        Spacer()
                        
                    }
                    .padding(.horizontal, 10)
                }
            
        }
    }
    
    @ViewBuilder
     private func imageEditView() -> some View {
        VStack{
            ZStack {
                Button {
                    PHPhotoLibrary.requestAuthorization { status in
                        switch status {
                        case .authorized:
                            showImagePicker.toggle()
                            if let selectedImage = selectedImage {
                                profileViewModel.userImage = selectedImage
                                profileViewModel.saveProfileImage(selectedImage)
                            }
                        case .denied:
                            deniedAlbum.toggle()
                            
                        case .restricted, .notDetermined:
                           break
                            
                        default:
                            break
                        }
                    }
                } label: {
                    if let profileImage = profileImage {
                        ZStack {
                            profileImage
                                .resizable()
                                .renderingMode(.original)
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                        }
                        
                    } else if profileViewModel.userImage == nil {
                        ZStack{
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .renderingMode(.original)
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                                .foregroundColor(.gray)
                        }
                    } else {
                        ZStack{
                            if let profileImages = profileViewModel.userImage {
                                Image(uiImage: profileImages)
                                    .resizable()
                                    .renderingMode(.original)
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                                    .clipShape(Circle())
                            }
                        }
                    }
                }
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                    ImagePicker(selectedImage: $selectedImage)
                }
            }
            
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
    @ViewBuilder
    private func profileSettingView() -> some View {
        Section {
            ForEach(ProfileSettingType.allCases, id: \.description) { item  in
                switch item {
                case .termsPolices:
                    ListArrowView(listTitle: item.description, showView: $showTermsView)
                        .onTapGesture {
                            showTermsPolicesView.toggle()
                        }
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
                    ListtLoginView(listTitle: item.description, showPOPUPView: $showLogoutPOPUPView, color: Color.colorAsset.blueGray)
                    
                case  .withdrawal:
                    ListtLoginView(listTitle: item.description, showPOPUPView: $showWithDrawPOPUPView, color: Color.red.opacity(0.5))
                }
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView()
                .environmentObject(dev.signUPViewModel)
        }
    }
}
