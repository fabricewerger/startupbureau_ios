//
//  ChecklistViewModel.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 12/01/2022.
//

import Foundation
import Combine
import UIKit

protocol ChecklistViewModel{
    func getChecklist(id: String)
}

class ChecklistViewModelImpl: ObservableObject, ChecklistViewModel {
    private let service: ChecklistService
    private(set) var checklist: Checklist?
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultStateChecklist = .loading
    
    init(service: ChecklistService) {
        self.service = service
    }
    
    func getChecklist(id: String) {
        self.state = .loading
        let cancellable = service.request(from: .getChecklist(id: id))
            .sink {
                res in
                switch res{
                case .finished:
                    guard let checklist = self.checklist else {
                        self.state = .failed(error: NSError())
                        return
                    }

                    self.state = .success(content: checklist)
                    break
                case .failure(let error):
                    self.state = .failed(error: error)
                    print(error.localizedDescription)
                    break
                }
            } receiveValue: {
                (response) in self.checklist = response
            }
        
        self.cancellables.insert(cancellable)
    }
}
