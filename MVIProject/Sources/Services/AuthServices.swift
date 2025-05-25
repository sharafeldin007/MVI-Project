//
//  AuthServices.swift
//  MVIProject
//
//  Created by Sharaf on 5/23/25.
//
import Foundation

protocol AuthService {
    func login(email: String, password: String) async throws -> User
}

struct User: Equatable {
    let email: String
}

struct MockAuthService: AuthService {
    func login(email: String, password: String) async throws -> User {
        try await Task.sleep(nanoseconds: 500_000_000)
        if email == "fail@example.com" {
            throw NSError(domain: "Auth", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"])
        }
        return User(email: email)
    }
}
