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
                let isLandscape = geometry.size.width > geometry.size.height
                
                let columnCount = isLandscape ? 4 : 2
                
                let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: columnCount)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(habitManager.habits) { habit in
                            HabitRowView(habit: habit)
                                .onTapGesture {
                                    habitManager.toggleHabit(habit)
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
        }
    }
}

#Preview {
    HabitPagePartView()
}
