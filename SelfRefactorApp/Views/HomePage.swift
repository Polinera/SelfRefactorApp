
import SwiftUI

struct HomePage: View {
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
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(rectangleColor)
                        .frame(height: 100)
                        .overlay(
                            Text("good job keep going")
                                .foregroundColor(.black)
                                .font(.headline)
                        )
                        .padding()
                    
                    Spacer()
                    Text("Habits")
                        .padding()
                    HStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(secondaryColor)
                                    .frame(height: 100)
                                    .padding()
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(secondaryColor)
                                    .frame(height: 100)
                                    .padding()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    Spacer()
                    VStack{
                        Image(systemName: "cat.fill")
                        Text("Mood dairy")
                        Text("Top 3 emotions")
                        HStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(secondaryColor)
                                        .frame(height: 100)
                                        .padding(.horizontal,10)
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(secondaryColor)
                                        .frame(height: 100) .padding(.horizontal,10)
                                       
                            RoundedRectangle(cornerRadius: 20)
                                .fill(secondaryColor)
                                .frame(height: 100) .padding(.horizontal,10)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                
                    Spacer()
                }

                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationTitle("Home Page")
               
            }
        }
    }

    #Preview {
        HomePage()
    }
