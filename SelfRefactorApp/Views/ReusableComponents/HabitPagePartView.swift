//
//  HabitPagePartView.swift
//  SelfRefactorApp
//
//  Created by REGC on 06/03/2025.
//

import SwiftUI

struct HabitPagePartView: View {
        @StateObject var habitManager = HabitManager()
        
        var body: some View {
            NavigationView {
                GeometryReader { geometry in
                    if geometry.size.width > geometry.size.height {

                        VStack(spacing: 16) {
                            
                                
                            ScrollView(.vertical, showsIndicators: false) {
                                LazyVStack(spacing: 16) {
                                    ForEach(habitManager.habits) { habit in
                                        HabitRowView(habit: habit)
                                            .onTapGesture {
                                                habitManager.toggleHabit(habit)
                                            }
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .padding(.horizontal)
                        }
                        .padding()
                    } else {
                        VStack {
                            
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 16) {
                                    ForEach(habitManager.habits) { habit in
                                        HabitRowView(habit: habit)
                                            .onTapGesture {
                                                habitManager.toggleHabit(habit)
                                            }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }

#Preview {
    HabitPagePartView()
}
