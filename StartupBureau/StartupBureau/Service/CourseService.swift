//
//  CourseService.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 24/11/2021.
//

import Foundation
import Combine

protocol CourseService {
    func request(from endpoint: CourseAPI) -> AnyPublisher<Course, APIError>
}

struct CourseServiceImpl: CourseService {
    
    func request(from endpoint: CourseAPI) -> AnyPublisher<Course, APIError> {
        
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown}
            .flatMap { data, response -> AnyPublisher<Course, APIError> in
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode){
                    
                    return Just(data)
                        .decode(type: Course.self, decoder: JSONDecoder())
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
