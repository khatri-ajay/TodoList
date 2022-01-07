//
//  Task.swift
//  TodoList
//
//  Created by Ajay Kumar on 07/01/2022.
//

import Foundation
import RealmSwift

class Task : Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id : ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
