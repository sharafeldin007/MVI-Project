//
//  LoginIntent.swift
//  MVIProject
//
//  Created by Sharaf on 5/23/25.
//
import Foundation

enum LoginIntent: Intentable {
    case updateEmail(String)
    case updatePassword(String)
    case submit
    case success(User)
    case failure(Error)
}

