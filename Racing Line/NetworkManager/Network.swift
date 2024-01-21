//
//  Network.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 21.01.24.
//

import Foundation

public class Network: NetworkService {
    public var session: URLSession
    public var decoder: JSONDecoder
    
    public init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
    
    public func request<T: Decodable>(with request: URL, handler: @escaping (Result<T, Error>) -> Void) {
        self.request(with: request) { (result: Result<Response<T>, Error>) in
            switch result {
            case .success(let response):
                handler(.success(response.data))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
    
    public func request<T: Decodable>(with request: URL, handler: @escaping (Result<Response<T>, Error>) -> Void) {
        self.request(with: request) { (result: Result<Response<Data>, Error>) in
            switch result {
            case .success(let response):
                do {
                    let data = try self.decoder.decode(T.self, from: response.data)
                    handler(.success((response: response.response, data: data)))
                } catch {
                    handler(.failure(NetworkError.parse))
                }
            case .failure(let error):
                handler(.failure(NetworkError.decode(error: error)))
            }
        }
    }
    
    public func request(with request: URL, handler: @escaping (Result<Response<Data>, Error>) -> Void) {
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                return handler(.failure(NetworkError.error(error: error)))
            }
            
            guard let data else {
                return handler(.failure(NetworkError.data))
            }
            
            guard let response = response as? HTTPURLResponse else {
                return handler(.failure(NetworkError.response))
            }
            
            guard (200..<300).contains(response.statusCode) else {
                return handler(.failure(NetworkError.status(code: response.statusCode, data: data)))
            }
            handler(.success((response: response, data: data)))
        }.resume()
    }
}
