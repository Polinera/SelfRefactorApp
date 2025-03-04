//
//  QuoteView.swift
//  SelfRefactorApp
//
//  Created by REGC on 04/03/2025.
//

import SwiftUI

struct QuoteView: View {
    
    @StateObject var quotesModel = DailyQuotesModel()
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.primaryColor)
                .frame(height: 100)
                .overlay(
                    Text(quotesModel.currentQuote)
                        .font(.headline)
                )
                .padding()
        }
    }
}

#Preview {
    QuoteView()
}
