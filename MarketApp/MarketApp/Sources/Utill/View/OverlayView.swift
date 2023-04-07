//
//  OverlayView.swift
//  MarketApp
//
//  Created by 서원지 on 2022/12/31.
//

import SwiftUI

struct OverlayView<OverlayContent: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    var modalContent: OverlayContent
    var yOffset: CGFloat // 하단에 뷰의 상단 일부를 노출시킬 크기
    var transition: AnyTransition = .move(edge: .bottom)
    var animation: Animation = .easeInOut
    
    func body(content: Content) -> some View {
        GeometryReader { geo in
            ZStack {
                
                content
        
                VStack {
                    if self.isPresented || yOffset > 0 {
                        self.modalContent
                            .transition(self.transition)
                            .animation(self.animation)
                            .offset(y: isPresented ? 0 : geo.size.height - yOffset)
                    } else {
                        Spacer()
                    }
                }
            }
        }
    }
}

extension OverlayView {
    init(isPresented: Binding<Bool>, modalContent: OverlayContent) {
        self._isPresented = isPresented
        self.yOffset = 0
        self.modalContent = modalContent
    }
    
    init(isPresented: Binding<Bool>, modalContent: OverlayContent, yOffset: CGFloat) {
        self._isPresented = isPresented
        self.yOffset = yOffset
        self.modalContent = modalContent
    }
}

extension View {
    func overlayModal<ModalContent: View>(isPresented: Binding<Bool>, @ViewBuilder modalContent: @escaping () -> ModalContent) -> some View {
        self.modifier(OverlayView(isPresented: isPresented, modalContent: modalContent()))
    }
    
    func overlayModal<ModalContent: View>(isPresented: Binding<Bool>, yOffset: CGFloat, @ViewBuilder modalContent: @escaping () -> ModalContent) -> some View {
        self.modifier(OverlayView(isPresented: isPresented, modalContent: modalContent(), yOffset: yOffset))
    }
    
    func hiddenConditionally(isHidden: Bool) -> some View {
        isHidden ? AnyView(self.hidden()) : AnyView(self)
    }
}
