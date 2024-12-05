//
//  WishCalendarViewController+Data.swift
//  eikhromovaPW2
//
//  Created by Imac on 05.12.2024.
//

import UIKit
import CoreData

// MARK: - Core Data Methods
extension WishCalendarViewController {
    
    internal func saveEvent(_ event: WishEventModel) {
        let context = CoreDataManager.shared.context
        let wishEvent = WishEvent(context: context)
        wishEvent.title = event.title
        wishEvent.descriptionText = event.description
        wishEvent.startDate = event.startDate
        wishEvent.endDate = event.endDate
        
        do {
            try context.save()
            loadEvents()
        } catch {
            print("Failed to save event: \(error)")
        }
    }
    
    internal func loadEvents() {
        let context = CoreDataManager.shared.context
        let fetchRequest: NSFetchRequest<WishEvent> = WishEvent.fetchRequest()
        
        do {
            let fetchedEvents = try context.fetch(fetchRequest)
            events = fetchedEvents.map { event in
                WishEventModel(
                    title: event.title ?? "",
                    description: event.descriptionText ?? "",
                    startDate: event.startDate ?? Date(),
                    endDate: event.endDate ?? Date()
                )
            }
        } catch {
            print("Failed to fetch events: \(error)")
        }
    }
    
    internal func deleteEvent(at index: Int) {
        let context = CoreDataManager.shared.context
        let fetchRequest: NSFetchRequest<WishEvent> = WishEvent.fetchRequest()
        do {
            let fetchedEvents = try context.fetch(fetchRequest)
            context.delete(fetchedEvents[index])
            try context.save()
            loadEvents()
        } catch {
            print("Failed to delete event: \(error)")
        }
    }
}
