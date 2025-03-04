//
//  HabbitAddingView.swift
//  SelfRefactorApp
//
//  Created by REGC on 03/03/2025.
//

import SwiftUI

struct HabbitAddingView: View {
    
    var  isDataAvailable = false
    
    var body: some View {
        VStack{
            if isDataAvailable {
                Text("sfdasf")
            }
            else {
                Text("no habbit yet")
            }
        }
    }
}

#Preview {
    HabbitAddingView()
}
