//
//  SignUPViewModel.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/09.
//

import SwiftUI
import Firebase
import FirebaseAuth
import AuthenticationServices
import GoogleSignIn
import FirebaseDatabase

class SignUPViewModel: ObservableObject {
    
    //MARK: - 유저
    @Published var userSession: FirebaseAuth.User?

    @Published var nonce: String  = ""
    @Published var loginStatus: Bool = false
    @Published var deleteUser: Bool = false
    //MARK: - 로그인 애니메이션 판별
    @AppStorage("log_status") var log_Status = false
    
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    //MARK: - 로그인
    func login(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result ,error in
            if let error = error {
                debugPrint("[🔥] 로그인 에 실패 하였습니다 \(error.localizedDescription)")
                return
            } else {
                guard let user = result?.user else { return }
                debugPrint("로그인에 성공 하였습니다")
                self.userSession = user
                self.loginStatus = true
                
            }
        }
    }
    
    //MARK: - 회원가입
    func register(withEmail email: String, password: String, nickName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result , error in
            if let error = error {
                debugPrint("[🔥] 회원가입에 실패 하였습니다 \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            debugPrint("회원가입에 성공 하였습니다 ")
            debugPrint("debug user is \(String(describing: self.userSession))")
            
            let data = ["email" : email ,
                        "uid" : user.uid]
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { data in
                    debugPrint("DEBUG : Upload user data : \(String(describing: data))")
                }
            
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = nickName
            
            changeRequest.commitChanges(){ error in
                if let error = error {
                    print("[ERROR] : displayName 변경 중 에러 발생 \(error.localizedDescription)")
                }
                else {
                    print("[DEBUG] : dispalyName 변경 성공")
                    self.userSession = user
                    self.loginStatus = true
                }
            }
        }
    }
    
    //MARK: - 로그아웃
    func signOut() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.userSession = nil
            self.loginStatus.toggle()
        }
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    func withdrawUser() {
        let firebaseAuth = Auth.auth()
        
        firebaseAuth.currentUser?.delete(completion: { error  in
            self.deleteUser = true
            print("유저가 삭제 되었습니다 \(String(describing: error?.localizedDescription))")
        })
        
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.commitChanges() { error in
            if let error = error {
                print("[ERROR] : photoURL 변경 중 에러 발생 \(error.localizedDescription)")
            }
            else {
                print("[DEBUG] : dispalyName 변경 성공")
                self.loginStatus = false
            }
        }
        Auth.auth().currentUser?.reload()
    }
    
    
    //MARK: - 회원정보 update
    func saveUserInformation(nickName: String) {
        let collectionPath = Firestore.firestore().collection("users")
        let userID = Auth.auth().currentUser?.uid
        
        collectionPath.document("\(userID ?? "")").updateData(["nickname": nickName]) { error in
            if let error = error {
                print((error.localizedDescription))
                return
            }
        }
        
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        
        changeRequest?.displayName = nickName
        changeRequest?.commitChanges() { error in
            if let error = error {
                print("[ERROR] : photoURL 변경 중 에러 발생 \(error.localizedDescription)")
            }
            else {
                print("[DEBUG] : dispalyName 변경 성공")
                
            }
        }
        Auth.auth().currentUser?.reload()
    }
    
    //MARK: -  애플 로그인
    func appleLogin(credential : ASAuthorizationAppleIDCredential ) {
        //MARK:  - 토큰 가져오기
        guard let token = credential.identityToken else {
            debugPrint("[🔥] 파이어 베이스 로그인 에 실패 하였습니다 ")
            return
        }
        //MARK: - 토큰을 문자열 변환
        guard let tokenString = String(data: token, encoding: .utf8) else {
            debugPrint("[🔥]  error with Token")
            return
        }
        
        let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com",
                                                          idToken: tokenString,
                                                          rawNonce: nonce)
        
        //MARK: - 파이어 베이스 로그인
        
        Auth.auth().signIn(with: firebaseCredential) { (result , error) in
            if let error = error {
                debugPrint("[🔥] 로그인 에 실패 하였습니다 \(error.localizedDescription)")
                return
            }   else {
                guard let user = result?.user else  {return}
                self.userSession = user
                debugPrint("[🔥]  로그인에  성공 하였습니다  \(user)")
                withAnimation(.easeInOut) {
                    self.loginStatus = true
                }
                
                let data = ["email" : result?.user.email ?? "" ,
                            "uid" : result?.user.uid ?? ""]
                Firestore.firestore().collection("users")
                    .document(result?.user.uid ?? "")
                    .setData(data) { data in
                        debugPrint("DEBUG : Upload user data : \(String(describing: data))")
                    }
            }
        }
    }
    
    //MARK: - 구글 로그인
    func googleLogin() {
        guard let clientID = FirebaseApp.app()?.options.clientID  else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting:  LoginManger.shared.getRootViewController()) {[self] user, error in
            if let error = error {
                debugPrint("[🔥] 로그인 에 실패 하였습니다 \(error.localizedDescription)")
                return
            }
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                
                debugPrint("[🔥]  로그인에  성공 하였습니다  \(String(describing: user?.profile?.email))")
                //                self.userSession = user
                return
            }
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    debugPrint("[🔥] 로그인 에 실패 하였습니다 \(error.localizedDescription)")
                    return
                } else {
                    debugPrint("[🔥]  로그인에  성공 하였습니다  \(String(describing: user))")
                    guard let user = authResult?.user else {return}
                    self.userSession = user
                    self.loginStatus = true
                    let data = ["email" : authResult?.user.email ?? "" ,
                                "uid" : authResult?.user.uid ?? ""]
                    Firestore.firestore().collection("users")
                        .document(authResult?.user.uid ?? "")
                        .setData(data) { data in
                            debugPrint("DEBUG : Upload user data : \(String(describing: data))")
                        }
                }
            }
        }
    }
    
}

