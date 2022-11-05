//
//  ContentView.swift
//  dsfas
//
//  Created by 현돌이 on 2022/11/05.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .trailing)
                    .padding(.leading)
                
                Spacer()
                
                Text("App Name")
                    .font(.system(size: 33, weight: .bold))
                    .padding(.trailing, 28)
                
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .trailing)
                Image(systemName: "cart")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .trailing)
                    .padding(.trailing)
                
            }
            Spacer()
            
            ScrollView(.horizontal){
                HStack{
                    Text("상의")
                        .font(.system(size: 13, weight: .bold))
                        .frame(width: 70, height: 40)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.leading, 5)
                    
                    Text("하의")
                        .font(.system(size: 13, weight: .bold))
                        .frame(width: 70, height: 40)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                    Text("아우터")
                        .font(.system(size: 13, weight: .bold))
                        .frame(width: 70, height: 40)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                    Text("신발")
                        .font(.system(size: 13, weight: .bold))
                        .frame(width: 70, height: 40)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)

                    Text("악세서리")
                        .font(.system(size: 13, weight: .bold))
                        .frame(width: 70, height: 40)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 40)
            }
            
            HStack{
                VStack{
                    ZStack{
                        Image(systemName: "tshirt")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 200, alignment: .trailing)
                            .background(.gray)
                        Button{
                            
                        }label: {
                            Image(systemName: "heart.fill")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                                .foregroundColor(.white)
                                .padding(.top, 170)
                                .padding(.leading, 100)
                        }
                    }
                    Text("Maison Kitsune")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .frame(width: 160, alignment: .leading)
                    Text("더블 폭스 패치 스니커즈")
                        .font(.system(size: 13, weight: .medium, design: .default))
                        .frame(width: 160, alignment: .leading)
                    Text("281,000원")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .frame(width: 160,  alignment: .leading)
                }
                VStack{
                    ZStack{
                        Image(systemName: "tshirt")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 200, alignment: .trailing)
                            .background(.gray)
                        Button{
                            
                        }label: {
                            Image(systemName: "heart.fill")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                                .foregroundColor(.white)
                                .padding(.top, 170)
                                .padding(.leading, 100)
                        }
                    }
                    Text("Maison Kitsune")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .frame(width: 160, alignment: .leading)
                    Text("더블 폭스 패치 스니커즈")
                        .font(.system(size: 13, weight: .medium, design: .default))
                        .frame(width: 160, alignment: .leading)
                    Text("281,000원")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .frame(width: 160,  alignment: .leading)
                }
            }
            
            HStack{
                VStack{
                    ZStack{
                        Image(systemName: "tshirt")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 200, alignment: .trailing)
                            .background(.gray)
                        Button{
                            
                        }label: {
                            Image(systemName: "heart.fill")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                                .foregroundColor(.white)
                                .padding(.top, 170)
                                .padding(.leading, 100)
                        }
                    }
                    Text("Maison Kitsune")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .frame(width: 160, alignment: .leading)
                    Text("더블 폭스 패치 스니커즈")
                        .font(.system(size: 13, weight: .medium, design: .default))
                        .frame(width: 160, alignment: .leading)
                    Text("281,000원")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .frame(width: 160,  alignment: .leading)
                }
                
                VStack{
                    ZStack{
                        Image(systemName: "tshirt")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 200, alignment: .trailing)
                            .background(.gray)
                        Button{
                            
                        }label: {
                            Image(systemName: "heart.fill")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                                .foregroundColor(.white)
                                .padding(.top, 170)
                                .padding(.leading, 100)
                        }
                    }
                    Text("Maison Kitsune")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .frame(width: 160, alignment: .leading)
                    Text("더블 폭스 패치 스니커즈")
                        .font(.system(size: 13, weight: .medium, design: .default))
                        .frame(width: 160, alignment: .leading)
                    Text("281,000원")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .frame(width: 160,  alignment: .leading)
                }
            }
            .padding(20)
           
            HStack{
                VStack{
                    Button{
                        
                    }label: {
                        Image(systemName: "square")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .foregroundColor(.gray)
                    }
                    Text("Home")
                        .font(.system(size: 10))
                }
                .padding(.trailing, 50)
                VStack{
                    Button{
                        
                    }label: {
                        Image(systemName: "square")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .foregroundColor(.gray)
                    }
                    Text("Home")
                        .font(.system(size: 10))
                }
                .padding(.trailing, 50)
                VStack{
                    Button{
                        
                    }label: {
                        Image(systemName: "square")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .foregroundColor(.gray)
                    }
                    Text("Home")
                        .font(.system(size: 10))
                }
                .padding(.trailing, 50)
                VStack{
                    Button{
                        
                    }label: {
                        Image(systemName: "square")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .foregroundColor(.gray)
                    }
                    Text("Home")
                        .font(.system(size: 10))
                }
            }
        }
    }
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
