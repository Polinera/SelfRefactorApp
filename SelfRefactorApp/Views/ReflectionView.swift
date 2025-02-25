//
//  ReflectionView.swift
//  SelfRefactorApp
//
//  Created by REGC on 21/02/2025.
//

import SwiftUI

struct ReflectionView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var rectangleColor: Color {
        colorScheme == .light
        ? Color(red: 242/255, green: 211/255, blue: 193/255)
        : Color(red: 0.1, green: 0.1, blue: 0.1)
    }
    var secondaryColor: Color {
        colorScheme == .light
        ? Color(red: 240/255, green: 238/255, blue: 235/255)
        : Color(red: 0.1, green: 0.1, blue: 0.1)
    }
    
    var body: some View {
        NavigationView {
            ScrollView{
                HStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(rectangleColor)
                        .frame(height: 100)
                        .padding()
                        .overlay{
                            NavigationLink(destination: GoalsPage()) {
                                Text("Goals")
                                    .font(.headline)
                                    .padding()
                            }
                        }
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(rectangleColor)
                                .frame(height: 100)
                                .padding()
                                .overlay{
                                    NavigationLink(destination: HabbitsPage()) {
                                        Text("Habbits")
                                            .font(.headline)
                                            .padding()
                                    }
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            Spacer()
                          
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(secondaryColor)
                        .frame(height: 100)
                        .padding()
                        .overlay(
                            Text("thought journal")
                        )
                    
                }
            }
        }
    }
}

#Preview {
    ReflectionView()
}
