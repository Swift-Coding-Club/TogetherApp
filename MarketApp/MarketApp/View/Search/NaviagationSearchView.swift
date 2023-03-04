//
//  SearchView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct NaviagationSearchView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.isSearching) private var isSearching
    
    @StateObject var viewModel: MainShoesViewModel = MainShoesViewModel()
    
    @State var searchText = ""
    @State private var removeSearch = false
    @State var recentSearchList : [String] = []
   
    @State var searchShoesResults : ShoesModel = []
    private let searchBarPlaceholder: String = "신발을 검색해주세요"
    
    private let minCharacters = 3
    
    var body: some View {
        VStack {
            if isSearching {
                SearchResultView()
            }
            CurrentSearchView()
            
            SearchResultView()
            
            Spacer()
        }
        .searchable(text: $searchText, prompt: searchBarPlaceholder)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                customBackButton()
            }
        }
        .onAppear {
            viewModel.mainShoesRequest()
        }
        .onChange(of: searchText) { searchText in
            if searchText.isEmpty {
                searchShoesResults = viewModel.shoesData ?? []
            } else {
                searchShoesResults = viewModel.shoesData?.filter({ shoes in
                    shoes.transName?.contains(searchText) ?? true
                }) ?? []
            }
            if searchText.count >=  minCharacters{
                appendItem()
            }
        }
    }
    
    //MARK: - 뒤로 가기 버튼
    @ViewBuilder
    private func customBackButton() -> some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .frame(width: 30, height: 30)
                .foregroundColor(.black)
        }

    }
    
    @ViewBuilder
    private func CurrentSearchView() -> some View{
        VStack {
            HStack {
                Text("최근 검색어")
                    .frame(width: 200, height: 30, alignment: .leading)
                    .font(.system(size: 17, weight: .semibold))
                Button(action: {
                    self.removeSearch.toggle()
                }, label: {
                    Text("기록 삭제")
                        .frame(width: 140, height: 30, alignment: .trailing)
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.gray)
                })
                .alert(Text("기록 전체 삭제"), isPresented: $removeSearch, actions: {
                    Button("확인", role: .destructive) { recentSearchList.removeAll() }
                    Button("취소", role: .cancel) {}
                }, message: {
                    Text("정말 삭제하시겠어요?")
                })
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(recentSearchList.sorted(), id: \.self) { searchText in
                        Text(searchText)
                            .frame(width: 100, height: 30, alignment: .center)
                            .nanumSquareNeo(family: .bRG, size: 15, color: .white)
                            .background(.black)
                            .cornerRadius(20)

                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    private func SearchResultView() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            SearchRowListView(shoesData: searchShoesResults)
        }
        .bounce(false)
    }
    
    private func appendItem() {
        recentSearchList.append(searchText)
        searchText = ""
    }
}


struct NaviagationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NaviagationSearchView()
        }
    }
}
