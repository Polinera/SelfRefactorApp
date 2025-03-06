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
  
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("secondaryColor"))
                .frame(height: 100)
                .padding()
                .overlay(
                    VStack {
                        Image(person.image)
                            .resizable()
                            .frame(width: 40, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: 10)
                        Text(person.name)
                    }
                )
                .padding()
        }
    }
}
