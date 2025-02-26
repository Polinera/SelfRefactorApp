//
//  PeopleModel.swift
//  SelfRefactorApp
//
//  Created by REGC on 24/02/2025.
//

import Foundation

class PeopleModel:ObservableObject {
    @Published var allPeople:[Person] = [
        Person(name: "Marie Curie", description:"fdsfs", image:"mariecurie"),
        Person(name: "Jolie", description: "fdsasgggr", image:"dog"),
        Person(name: "Ann", description:"fdsfs", image:"cat"),
        Person(name: "Jolie", description: "fdsasgggr", image:"dog"),
        Person(name: "Ann", description:"fdsfs", image:"cat"),
        Person(name: "Jolie", description: "fdsasgggr", image:"dog")
    ]
    
    @Published var searchText: String = ""
}
