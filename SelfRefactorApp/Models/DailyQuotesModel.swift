//
//  DailyQuotesModel.swift
//  SelfRefactorApp
//
//  Created by REGC on 24/02/2025.
//

import Foundation

class DailyQuotesModel:ObservableObject {
    @Published var currentQuote: String = ""
    
    private let allQuotes: [String] = [
        "fdsfsddfsd",
        "aasaaaaaa",
        "bbbbbbbbb",
        "ccccccccc"
    ]
    
    init(){
        updateQuote()
    }
    
    func updateQuote(){
        currentQuote = allQuotes.randomElement() ?? ""
    }
}
