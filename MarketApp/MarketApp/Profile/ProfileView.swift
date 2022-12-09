//
//  ProfileView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                MyProfile()
                    .padding(.bottom, 45)
                
                MenuList()
            }
            .navigationTitle("APP NAME")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: NavigationLink(destination: CartView()) {
                Image(systemName: "cart")
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .trailing)
            })
            .navigationBarItems(trailing: NavigationLink(destination: SearchView()) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .trailing)
            })
            .navigationBarItems(leading: NavigationLink(destination: NotiView()) {
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .trailing)
            })
        }
        .accentColor(.black)
    }
    
    @ViewBuilder
    private func MyProfile() -> some View {
        HStack {
            ZStack {
                Image("shoes")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .cornerRadius(135)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 28, height: 28)
                })
                .padding(.top, 90)
                .padding(.leading, 100)
            }
            .padding(.top, 30)
            
            VStack {
                HStack {
                    Text("NickName")
                        .font(.system(size: 20))
                        .frame(width: 150, height: 30, alignment: .leading)
                        .padding(.trailing, -60)
                    
                    ZStack {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "pencil")
                                .resizable()
                                .frame(width: 20, height: 20)
                        })
                    }
                }
                .padding(.leading, -32)
                
                Text("Point : 3000")
                    .font(.system(size: 26))
                    .frame(width: 150, height: 30, alignment: .leading)
            }
            .padding(.leading, 25)
        }
    }
    
    @ViewBuilder
    private func MenuList() -> some View {
        VStack {
            NavigationLink(destination: OrderView()) {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 350, height: 100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 1)
                        )
                    
                    HStack {
                        Text("주문 내역")
                            .padding(.trailing, 200)
                                  
                        Text("2")
                            .fontWeight(.medium)
                    }
                    .font(.system(size: 20))
                }
            }
            
            NavigationLink(destination: ProfileReviewView()) {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 350, height: 100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 1)
                        )
                    
                    HStack {
                        Text("내 리뷰")
                            .padding(.trailing, 220)
                        
                        Text("2")
                            .fontWeight(.medium)
                    }
                    .font(.system(size: 20))
                }
            }
            
            NavigationLink(destination: CouponView()) {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 350, height: 100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 1)
                        )
                    
                    HStack {
                        Text("쿠폰")
                            .padding(.trailing, 240)
                        
                        Text("5")
                            .fontWeight(.medium)
                    }
                    .font(.system(size: 20))
                }
            }
            .padding(.bottom, 60)
            
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("로그아웃")
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                        .frame(width: 170, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(.black, lineWidth: 1)
                        )
                })
                
                Button(action: {
                    
                }, label: {
                    Text("회원탈퇴")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .frame(width: 170, height: 50)
                        .background(.black)
                })
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
