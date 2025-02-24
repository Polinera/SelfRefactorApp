//
//  Person.swift
//  SelfRefactorApp
//
//  Created by REGC on 24/02/2025.
//

import Foundation

struct Person:Identifiable {
    let id: UUID = UUID()
    let name: String
    let description: String
    let image: String
}
