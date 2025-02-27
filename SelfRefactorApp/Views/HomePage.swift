
import SwiftUI

struct HomePage: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var quotesModel = DailyQuotesModel()
    @State var rating: Double = 50
    @StateObject var modelHabit = MainPageHabitsModel()
    
    var body: some View {
            NavigationView {
                VStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("primaryColor"))
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
                            MainPageEmojiView(rating: 20, total: 100, emoji: "😀")
                            MainPageEmojiView(rating: 40, total: 100, emoji: "😜")
                            MainPageEmojiView(rating: 75, total: 100, emoji: "🤩")
                            }
                        
                                       
                            
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                
                    Spacer()
               
                }

                .frame(maxWidth: .infinity, maxHeight: .infinity)
               
            }
        }
    

    #Preview {
        HomePage()
    }
