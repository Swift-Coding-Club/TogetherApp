//
//  PopView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/26.
//

import SwiftUI

enum shoes : String, CaseIterable {
    case one = "230"
    case two = "240"
    case three = "250"
    case four = "260"
    case five = "270"
    case six = "280"
}

struct PopView: View {
    
    //@Environment(\.dismiss) var dismiss
    
    @State private var clickEvent = 1
    @State private var shoeSize = "사이즈 선택하기"
    
    @State private var buyNow = false //구매하기
    @State private var basketShoe = false //장바구니
        
    var body: some View {
        popUp()
    }
    
    @ViewBuilder
    private func popUp() -> some View {
        VStack {
            Text("더블 폭스 패치 스니커즈")
                .foregroundColor(.black)
                .font(.system(size: 15, weight: .medium))
                .frame(maxWidth: .infinity, minHeight: 10, alignment: .leading)
                .padding()
            
            Picker("사이즈 선택", selection: $shoeSize) {
                ForEach(shoes.allCases, id: \.self) { item in
                    Text(item.rawValue)
                }
            }
            .pickerStyle(.menu)
            .foregroundColor(.black)
            .frame(maxWidth: 350, minHeight: 50, alignment: .center)
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(.gray, lineWidth: 1)
            )
            
            HStack {
                HStack {
                    Button(action: {
                        clickEvent -= 1
                    }, label: {
                        Text("-")
                    })
                    .foregroundColor(.gray)
                    .frame(width: 30, height: 20, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(.gray, lineWidth: 1)
                    )
                    Text(clickEvent.description)
                        .foregroundColor(.black)
                        .frame(width: 50, height: 30, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(.black, lineWidth: 1)
                        )
                        .padding()
                    Button(action: {
                        clickEvent += 1
                    }, label: {
                        Text("+")
                    })
                    .foregroundColor(.gray)
                    .frame(width: 30, height: 20, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(.gray, lineWidth: 1)
                    )
                }.padding(.trailing, 20)
                
                HStack {
                    Text("총 금액")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.gray)
                    Text("20000원") //MARK : 기본값 * clickEvent
                        .font(.system(size: 17, weight: .medium))
                        .frame(width: 100, height: 25, alignment: .trailing)
                        .foregroundColor(.black)
                }
            }.padding()
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("장바구니")
                        .font(.system(size: 17, weight: .medium))
                        .frame(width: 180, height: 50)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(.black, lineWidth: 2)
                        )
                })
                
                Button(action: {
                    
                }, label: {
                    Text("구매하기")
                        .font(.system(size: 17, weight: .medium))
                        .frame(width: 180, height: 50)
                        .foregroundColor(.white)
                        .background(.black)
                })
            }
        }
        .frame(height: 300)
    }
}

//struct testViews<Content>: UIViewControllerRepresentable where Content : View {
//
//    @Binding private var presented : Bool
//
//    let viewController = UIViewController()
//
//    func makeUIViewController(context: Context) -> UIViewController {
//
//        viewController.modalPresentationStyle = .pageSheet
//
//        if let sheets = viewController.sheetPresentationController {
//            //sheets.detents = [.medium()]
//            sheets.selectedDetentIdentifier = .medium
//        }
//
//        return viewController
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        if self.presented {
//            viewController.present(viewController, animated: true)
//        } else {
//            viewController.dismiss(animated: true)
//        }
//    }
//}

struct PopView_Previews: PreviewProvider {
    static var previews: some View {
        PopView()
    }
}
