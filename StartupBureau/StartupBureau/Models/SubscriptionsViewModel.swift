//
//  SubscriptionsViewModel.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 11/12/2021.
//

import Foundation
import Combine
import UIKit

protocol SubscriptionsViewModel{
    func getSubscriptions()
}

class SubscriptionsViewModelImpl: ObservableObject, SubscriptionsViewModel {
    private let service: SubscriptionsService
    private(set) var subscriptions: Subscriptions = []
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultStateSubscriptions = .loading
    
    init(service: SubscriptionsService) {
        self.service = service
    }
    
    func getSubscriptions() {
        self.state = .loading
        let cancellable = service.request(from: .getSubscriptions)
            .sink {
                res in
                switch res{
                case .finished:
                    self.state = .success(content: self.subscriptions)
                    break
                case .failure(let error):
                    self.state = .failed(error: error)
                    print(error.localizedDescription)
                    break
                }
            } receiveValue: {
                (response) in self.subscriptions = response
            }
        
        self.cancellables.insert(cancellable)
    }
}
