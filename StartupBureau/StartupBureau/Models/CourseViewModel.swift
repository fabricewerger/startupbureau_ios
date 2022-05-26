//
//  CourseViewModel.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 24/11/2021.
//

import Foundation
import Combine
import UIKit

protocol CourseViewModel{
    func getCourses()
}

class CourseViewModelImpl: ObservableObject, CourseViewModel {
    private let service: CourseService
    private(set) var courses: Course = []
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: CourseService) {
        self.service = service
    }
    
    func getCourses() {
        self.state = .loading
        let cancellable = service.request(from: .getCourse)
            .sink {
                res in
                switch res{
                case .finished:
                    self.state = .success(content: self.courses)
                    break
                case .failure(let error):
                    self.state = .failed(error: error)
                    print(error.localizedDescription)
                    break
                }
            } receiveValue: {
                (response) in self.courses = response
            }
        
        self.cancellables.insert(cancellable)
    }
}
