import CoreData

struct PersistenceController {
    static let shared = NSPersistentContainer()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "goalModel")
        
        if inMemory{
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores {description, error in
            if let error = error {
                fatalError("Unable to load")
            }
            
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
