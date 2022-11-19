//
//  SearchView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct SearchView: View {
    
    @State var serchingItem: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 15, height: 20, alignment: .trailing)
                    .padding(.leading)
                
                Text("APP NAME")
                    .font(.system(size: 20, design: .serif))
                    .padding(.leading)
                
                Spacer()
            }
            TextField("Serch", text: $serchingItem)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
