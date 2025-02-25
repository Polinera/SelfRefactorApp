
import SwiftUI

struct HomePage: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var quotesModel = DailyQuotesModel()
    @State var rating: Double = 50
    @StateObject var modelHabit = MainPageHabitsModel()
    
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
                            Text(quotesModel.currentQuote)
                                .foregroundColor(.black)
                                .font(.headline)
                        )
                        .padding()
                    
                    Text("Habits")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(modelHabit.habits) { habit in
                                        HabitRowView(habit: habit)
                                            .onTapGesture {
                                                modelHabit.markHabitAsDone(habit)
                                            }
                                    }
                                }
                            }
            
                    VStack{
                        Text("Mood dairy")
                        Text("Top 3 emotions")
                        
                        HStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(secondaryColor)
                                        .frame(height: 100)
                                        .padding(.horizontal,10)
                                        .overlay(
                                            Text("😀")
                                                    .font(.system(size: 50))
                                        )
                                    
                            Gauge(value: rating, in: 0...100){
                            }
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        HStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(secondaryColor)
                                        .frame(height: 100)
                                        .padding(.horizontal,10)
                                        .overlay(
                                            Text("🤩")
                                                    .font(.system(size: 50))                                        )
                                    
                            Gauge(value: rating, in: 0...100){
                                
                            }
                                       
                            
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        HStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(secondaryColor)
                                        .frame(height: 100)
                                        .padding(.horizontal,10)
                                        .overlay(
                                            Text("😜")
                                                   .font(.system(size: 50))
                                        )
                                    
                            Gauge(value: rating, in: 0...100){
                                
                            }
                                       
                            
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                
                    Spacer()
                }

                .frame(maxWidth: .infinity, maxHeight: .infinity)
               
            }
        }
    }

    #Preview {
        HomePage()
    }
