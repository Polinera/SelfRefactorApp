//
//  ReflectionView.swift
//  SelfRefactorApp
//
//  Created by REGC on 21/02/2025.
//

import SwiftUI

struct ReflectionView: View {
   
    
    var body: some View {
        NavigationView {
            ScrollView{
                HStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("primaryColor"))
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
                                .fill(Color("primaryColor"))
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
                        .fill(Color("secondaryColor"))
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
