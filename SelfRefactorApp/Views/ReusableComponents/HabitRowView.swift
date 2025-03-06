//
//  HabitRowView.swift
//  SelfRefactorApp
//
//  Created by REGC on 25/02/2025.
//

import SwiftUI

struct HabitRowView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let habit:Habit
    
    var secondaryColor: Color {
        colorScheme == .light
        ? Color(red: 240/255, green: 238/255, blue: 235/255)
        : Color(red: 0.1, green: 0.1, blue: 0.1)
    }
    
    var doneColor: Color {
        colorScheme == .light
        ? Color(red:169/255, green: 182/255, blue: 127/255)
        : Color(red: 0.1, green: 0.1, blue: 0.1)
    }
    
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(habit.isDone ? doneColor :secondaryColor)
                .frame(width: 200, height: 100)
                .padding()
                .overlay(
                    VStack {
                        Text((habit.isDone ? "Done ":"") + habit.name)
                    }
                )
               
        }
    }
}
