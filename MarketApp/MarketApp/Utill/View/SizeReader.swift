//
//  SizeReader.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/03.
//

import SwiftUI

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: FlexibleSizePreferenceKey.self, value: geometryProxy.size)
            }
        )
            .onPreferenceChange(FlexibleSizePreferenceKey.self, perform: onChange)
    }
    
    func readRect(onChange: @escaping (CGRect) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: FlexibleFramePreferenceKey.self, value: geometryProxy.frame(in: .global))
            }
        )
            .onPreferenceChange(FlexibleFramePreferenceKey.self, perform: onChange)
    }
    
    func readRect(name: String, onChange: @escaping (CGRect) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: FlexibleFramePreferenceKey.self, value: geometryProxy.frame(in: .named(name)))
            }
        )
            .onPreferenceChange(FlexibleFramePreferenceKey.self, perform: onChange)
    }
}

private struct FlexibleSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

private struct FlexibleFramePreferenceKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
}

