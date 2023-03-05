//
//  LanuchView.swift
//  MarketApp
//
//  Created by 서원지 on 2022/12/21.
//

import SwiftUI

struct LanuchView: View {
    @Binding var showLanchView: Bool
    
    
    var body: some View {
        ZStack{
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                    .frame(height: 170)
                
                
                Image("appIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding(.horizontal , 45)
                
                
                Spacer()
                    .frame(height: 100)
                
                
                Text("AFFINITY")
                    .nanumSquareNeo(family: .eHv, size: 40, color: Color.colorAsset.lightBlack)
                Spacer(minLength: .zero)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                showLanchView.toggle()
            }
        }
    }
}

struct LanuchView_Previews: PreviewProvider {
    static var previews: some View {
        LanuchView(showLanchView: .constant(false))
    }
}
