//
//  Habit.swift
//  SelfRefactorApp
//
//  Created by REGC on 25/02/2025.
//

import SwiftUI

struct Habit: Identifiable, Codable {
    let id = UUID()
    let name: String
    var isDone: Bool = false
}

