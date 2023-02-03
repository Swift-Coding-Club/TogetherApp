//
//  View+ReceiveTimer.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/03.
//

import SwiftUI
import Combine

@available(iOS 13.0, *)
typealias TimePublisher = Publishers.Autoconnect<Timer.TimerPublisher>

@available(iOS 13.0, *)
extension View {
    
    func onReceive(timer: TimePublisher?, perform action: @escaping (Timer.TimerPublisher.Output) -> Void) -> some View {
        Group {
            if let timer = timer {
                self.onReceive(timer, perform: { value in
                    action(value)
                })
            } else {
                self
            }
        }
    }
}

