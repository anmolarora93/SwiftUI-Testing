//
//  LoginScreenViewModel.swift
//  UITestingSample
//
//

import Foundation

enum DataError: Error {
    case invalidData
    case invalidResponse
    case message(_ error: Error?)
}

final class LoginScreenViewModel {
    func loginButtonPressed(completion: @escaping (Result<Users, DataError>) -> Void) {
        let urlRequest = URLRequest(url: URL(string: "https://dummyjson.com/users")!)
        URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, 200 ... 299  ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }

            do {
                let users = try JSONDecoder().decode(Users.self, from: data)
                completion(.success(users))
            }
            catch {
                completion(.failure(.message(error)))
            }
        }.resume()
    }
}
