//
//  HistoryPage.swift
//  SelfRefactorApp
//
//  Created by REGC on 21/02/2025.
//

import SwiftUI

struct HistoryPage: View {
    @StateObject var model = PeopleModel()
    @Environment(\.colorScheme) var colorScheme
    var secondaryColor: Color {
           colorScheme == .light
        ? Color(red: 240/255, green: 238/255, blue: 235/255)
        : Color(red: 0.1, green: 0.1, blue: 0.1)
       }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(model.allPeople) { person in
                                PersonRowView(person: person)
                            }
            }
            .searchable(text: $model.searchText)
        }
    }
    }


#Preview {
    HistoryPage()
}
