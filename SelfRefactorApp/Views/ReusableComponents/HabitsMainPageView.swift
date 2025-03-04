//
//  HabitsMainPageView.swift
//  SelfRefactorApp
//
//  Created by REGC on 04/03/2025.
//

import SwiftUI

struct HabitsMainPageView: View {

    @StateObject var modelHabit = MainPageHabitsModel()
    
    var body: some View {
        GeometryReader { geometry in
            if geometry.size.width > geometry.size.height {
                VStack(spacing: 16) {
                    Text(String(localized: "Habits"))
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            ForEach(modelHabit.habits) { habit in
                                HabitRowView(habit: habit)
                                    .onTapGesture {
                                        modelHabit.toggleHabitDone(habit)
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
                    Text(String(localized: "Habits"))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(modelHabit.habits) { habit in
                                HabitRowView(habit: habit)
                                    .onTapGesture {
                                        modelHabit.toggleHabitDone(habit)
                                    }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        
        
    }
}

#Preview {
    HabitsMainPageView()
}
