//
//  NetworkService.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 21.01.24.
//

import Foundation

public protocol NetworkService {
    typealias Response<T> = (response: HTTPURLResponse, data: T)
    
    func request<T: Decodable>(with request: URL, handler: @escaping (Result<T, Error>) -> Void)
    
    func request(with request: URL, handler: @escaping (Result<Response<Data>, Error>) -> Void)
}
