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
                ProfileInfo()
                    .padding(.bottom, 30)
                ListMyshop()
            }
            .navigationTitle("APP NAME")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: NavigationLink(destination: CartView()){
                Image(systemName: "cart").resizable()
                    .frame(width: 25, height: 25, alignment: .trailing)
            }).foregroundColor(.black)
            .navigationBarItems(trailing: NavigationLink(destination: SearchView()){
                Image(systemName: "magnifyingglass").resizable()
                    .frame(width: 25, height: 25, alignment: .trailing)
            }).foregroundColor(.black)
            .navigationBarItems(leading: NavigationLink(destination: NotiView()){
                Image(systemName: "bell").resizable()
                    .frame(width: 25, height: 25, alignment: .trailing)
            }).foregroundColor(.black)
        }
    }
    
    @ViewBuilder
    private func ProfileInfo() -> some View {
        let points = 3000
        
        HStack {
            ZStack {
                Image("shoes")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .cornerRadius(120)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.top, 80)
                        .padding(.leading, 80)
                })
            }.padding(.top, 30)
            
            VStack {
                Text("Violet purple")
                    .frame(width: 150, height: 30, alignment: .leading)
                    .font(.system(size: 20))
                Text("Point :   \(points)")
                    .frame(width: 150, height: 30, alignment: .leading)
                    .font(.system(size: 18))
            }.padding(.leading, 30)
        }
    }
    
    @ViewBuilder
    private func ListMyshop() -> some View {
        let numbers = 2
        
        VStack {
            NavigationLink(destination: Order()) {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 350, height: 100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    HStack {
                        Text("주문 내역")
                            .padding(.trailing, 180)
                        Text("\(numbers)")
                    }
                    .font(.system(size: 20))
                }
            }
            
            NavigationLink(destination: Review()) {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 350, height: 100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    HStack {
                        Text("내 리뷰")
                            .padding(.trailing, 200)
                        Text("\(numbers)")
                    }
                    .font(.system(size: 20))
                }
            }
            
            NavigationLink(destination: Coupon()) {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 350, height: 100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    HStack {
                        Text("쿠폰")
                            .padding(.trailing, 220)
                        Text("5")
                    }
                    .font(.system(size: 20))
                }.padding(.bottom, 100)
            }
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("로그아웃")
                        .font(.system(size: 17, weight: .medium))
                        .frame(width: 170, height: 50)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(.black, lineWidth: 1)
                        )
                })
                
                Button(action: {
                    
                }, label: {
                    Text("회원탈퇴")
                        .font(.system(size: 17, weight: .medium))
                        .frame(width: 170, height: 50)
                        .foregroundColor(.white)
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
