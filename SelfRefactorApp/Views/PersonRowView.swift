//
//  PersonRowView.swift
//  SelfRefactorApp
//
//  Created by REGC on 24/02/2025.
//

import SwiftUI

struct PersonRowView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let person: Person
    
    var secondaryColor: Color {
        colorScheme == .light
        ? Color(red: 240/255, green: 238/255, blue: 235/255)
        : Color(red: 0.1, green: 0.1, blue: 0.1)
    }
    
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(secondaryColor)
                .frame(height: 100)
                .padding()
                .overlay(
                    VStack {
                        Image(systemName: person.image)
                        Text(person.name)
                    }
                )
                .padding()
        }
    }
}
