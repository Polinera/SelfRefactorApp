//
//  DetailedPersonPage.swift
//  SelfRefactorApp
//
//  Created by REGC on 24/02/2025.
//

import SwiftUI

struct DetailedPersonPage: View {
    let person: Person
    
    var body: some View {
        VStack(spacing:20){
            Text(person.name)
            Text(person.description)
        }
    }
}
