//
//  ProfileViewModel.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/06.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseStorage

class ProfileViewModel: ObservableObject {
    
    static let cache = NSCache<NSString, UIImage>()
    
    @Published var userNickName: String?
    @Published var userEmail: String?
    @Published var userImageURL: URL?
    @Published var userImage: UIImage?
    
    init() {
        getUserInformation()
    }
    
    //MARK: - 유저 가지고 오기
    func getUserInformation() {
        let collectionPath = Firestore.firestore().collection("users")
        let userId = Auth.auth().currentUser?.uid
        
        guard let userId = userId else { return }
        
        collectionPath.whereField("uid", isEqualTo: userId).addSnapshotListener { snap, error in
            if let error = error {
                print("[❌] ERROR: 유저 가져오기 실패")
                print(error.localizedDescription)
                return
            }
            
            for document in snap!.documentChanges {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.userEmail = document.document.get("email") as? String
                    self.userNickName = document.document.get("nickname") as? String
                }
            }
        }
        
        self.userImageURL = Auth.auth().currentUser?.photoURL
        
        print("[DEBUG] 유저 이미지 URL : \(String(describing: self.userImageURL))")
        
        if userImageURL != nil {
            self.getProfileImage()
        }
        
        print("[DEBUG] 유저 이름: \(String(describing: self.userNickName))")
        
    }
    
    func saveProfileImage(_ image: UIImage) {
        ImageUploader.uploadImage(image: image) { profileImageURL in
            let imageData = URLSession.shared.dataTask(with: profileImageURL) { data, responseURL, error in
                if error != nil {
                    print("[ERROR] : 이미지 다운로드 실패 \(String(describing: error?.localizedDescription))")
                }
                
                var downloadedImage: UIImage?
                
                if let data = data {
                    print("[DEBUG] : 데이터 언랩 후 UIImage 형태로 저장 성공")
                    downloadedImage = UIImage(data: data)
                }
                
                if downloadedImage != nil {
                    print("[DEBUG] : 이미지 캐시에 저장 완료")
                    ProfileViewModel.cache.setObject(downloadedImage!, forKey: profileImageURL.absoluteString as NSString)
                }
                
                DispatchQueue.main.async {
                    print("[DEBUG] : 유저 이미지 저장")
                    self.userImage = downloadedImage
                }
                print("[DEBUG] : 유저 이미지 : \(String(describing: self.userImage))")
            }
            
            imageData.resume()
            
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            
            changeRequest?.photoURL = profileImageURL
            changeRequest?.commitChanges(){ error in
                if let error = error {
                    print("[ERROR] : photoURL 변경 중 에러 발생 \(error.localizedDescription)")
                }
                else {
                    print("[DEBUG] : photoURL 업로드 성공")
                }
            }
        }
    }
    
    func downloadProfileImage() {
        print("[DEBUG] : downloadImaeg 실행")
        
        if let url = userImageURL {
            print("[DEBUG] : 이미지 url 옵셔널 언래핑 성공")
            let dataTask = URLSession.shared.dataTask(with: url) { data, responseURL, error in
                print("[DEBUG] : data 출력 : \(String(describing: data))")
                
                if error != nil {
                    print("[ERROR] : 이미지 다운로드 실패 \(String(describing: error?.localizedDescription))")
                }
                
                var downloadedImage: UIImage?
                
                if let data = data {
                    print("[DEBUG] : 데이터 언랩 후 UIImage 형태로 저장 성공")
                    downloadedImage = UIImage(data: data)
                }
                
                if downloadedImage != nil {
                    print("[DEBUG] : 이미지 캐시에 저장 완료")
                    ProfileViewModel.cache.setObject(downloadedImage!, forKey: url.absoluteString as NSString)
                }
                
                DispatchQueue.main.async {
                    print("[DEBUG] : 유저 이미지 저장")
                    self.userImage = downloadedImage
                }
                print("[DEBUG] : 유저 이미지 : \(String(describing: self.userImage))")
            }
            
            dataTask.resume()
        } else {
            print("[ERROR] : 이미지 uRL = nil, \(String(describing: userImageURL))")
        }
    }
    
    func getProfileImage() {
        print("[DEBUG] : getProfileImage 실행")
        
        if let cacheImage = ProfileViewModel.cache.object(forKey: self.userImageURL!.absoluteString as NSString) {
            self.userImage = cacheImage
        } else {
            Task {
                downloadProfileImage()
            }
        }
    }
    
}
