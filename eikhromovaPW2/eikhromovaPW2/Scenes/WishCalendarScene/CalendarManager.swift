import UIKit
import EventKit

// MARK: - CalendarEventManager Protocol
protocol CalendarEventManager {
    func create(eventModel: WishEventModel) -> Bool
}

// MARK: - WishEventModel
struct WishEventModel {
    var title: String
    var description: String
    var startDate: Date
    var endDate: Date
    var note: String?
}

// MARK: - CalendarManager
final class CalendarManager: CalendarEventManager {
    
    // MARK: - Properties
    private let eventStore: EKEventStore = EKEventStore()
    
    // MARK: - Public Methods
    func create(eventModel: WishEventModel) -> Bool {
        var result: Bool = false
        let group = DispatchGroup()
        group.enter()
        
        create(eventModel: eventModel) { isCreated in
            result = isCreated
            group.leave()
        }
        
        group.wait()
        return result
    }
    
    func create(eventModel: WishEventModel, completion: ((Bool) -> Void)?) {
        let createEvent: EKEventStoreRequestAccessCompletionHandler = { [weak self] (granted, error) in
            guard granted, error == nil, let self = self else {
                completion?(false)
                return
            }
            
            // MARK: - Event Creation
            let event: EKEvent = EKEvent(eventStore: self.eventStore)
            
            event.title = eventModel.title
            event.startDate = eventModel.startDate
            event.endDate = eventModel.endDate
            event.notes = eventModel.note
            event.calendar = self.eventStore.defaultCalendarForNewEvents
            
            do {
                try self.eventStore.save(event, span: .thisEvent)
                completion?(true)
            } catch let error as NSError {
                print("Failed to save event with error: \(error)")
                completion?(false)
            }
        }
        
        // MARK: - Request Access
//        if #available(iOS 17.0, *) {
//            eventStore.requestFullAccessToEvents(completion: createEvent)
//        } else {
            eventStore.requestAccess(to: .event, completion: createEvent)
//        }
    }
}
