//
//  Pais+CoreDataProperties.swift
//  DataPersistenceWithCoreData
//
//  Created by Enrique Solís on 05-12-21.
//
//

import Foundation
import CoreData


extension Pais {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pais> {
        return NSFetchRequest<Pais>(entityName: "Pais")
    }

    @NSManaged public var nombre: String?

}

extension Pais : Identifiable {

}
