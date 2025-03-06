import SwiftUI
import CoreData

@main
struct SelfRefactorAppApp: App {
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "AppModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error loading persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            TabBar()
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
    
}
