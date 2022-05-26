//
//  ChecklistService.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 12/01/2022.
//

import Foundation
import Combine

protocol ChecklistService {
    func request(from endpoint: CourseAPI) -> AnyPublisher<Checklist, APIError>
}

struct ChecklistServiceImpl: ChecklistService {
    
    func request(from endpoint: CourseAPI) -> AnyPublisher<Checklist, APIError> {
        
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown}
            .flatMap { data, response -> AnyPublisher<Checklist, APIError> in
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode){
                    
                    return Just(data)
                        .decode(type: Checklist.self, decoder: JSONDecoder())
                        .mapError { error in
                            guard let error = error as? DecodingError else { return .general(error) }
                            
                            return .decodingError(error)
                        }
                        .eraseToAnyPublisher()
                } else{
                    print(response)
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
                
            }
            .eraseToAnyPublisher()
    }
}
