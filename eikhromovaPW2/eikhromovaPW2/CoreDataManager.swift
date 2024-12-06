import CoreData

// MARK: - CoreDataManager Singleton
class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    // MARK: - Private Initializer
    private init() {}

    // MARK: - Persistent Container Setup
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WishEventModel")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
        return container
    }()
    
    // MARK: - Managed Object Context
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Save Context
    func saveContext() {
        let context = persistentContainer.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
