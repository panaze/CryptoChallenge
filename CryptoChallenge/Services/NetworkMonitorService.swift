//
//  NetworkMonitorService.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 20/01/25.
//

import Foundation
import Network

@MainActor
class NetworkMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")

    @Published var isConnected: Bool = true

    init() {
        monitor.pathUpdateHandler = { path in
            Task { @MainActor in
                self.isConnected = (path.status == .satisfied)
            }
        }
        monitor.start(queue: queue)
    }

    deinit {
        monitor.cancel()
    }
}

