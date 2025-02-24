//
//  TabBar.swift
//  SelfRefactorApp
//
//  Created by REGC on 21/02/2025.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Text("Home")
                }
            
            ReflectionView()
                .tabItem {
                    Text("Reflection")
                }
            
            HistoryPage()
                .tabItem{
                    Text("History")
                }
        }
    }
}

#Preview {
    TabBar()
}
