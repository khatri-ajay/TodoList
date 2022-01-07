//
//  RealmManager.swift
//  TodoList
//
//  Created by Ajay Kumar on 07/01/2022.
//

import Foundation
import RealmSwift
class RealmManager : ObservableObject{
    private(set) var localRealm : Realm?
    @Published private(set) var tasks : [Task] = []
    
    init(){
        openRealm()
        getTask()
        
    }
    
    
    func openRealm() {
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        }
        catch{
            print("error Opening realm: \(error)")
        }
    }
    func addTask(taskTitle: String) {
        if let localRealm = localRealm{
            do{
                try localRealm.write{
                    let newTask = Task(value: ["title":taskTitle,"completed":false])
                    localRealm.add(newTask)
                    getTask()
                    print("add new task : \(newTask)")
                }
            }
            catch{
                print("error adding task to Realm: \(error)")
            }
        }
    }
    func getTask() {
        if let localRealm = localRealm{
           let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    func updateTask(id: ObjectId,completed : Bool) {
        if let localRealm = localRealm{
            do{
                let tasktoUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@",id))
                guard !tasktoUpdate.isEmpty else {return}
                try localRealm.write{
                    tasktoUpdate[0].completed = completed
                    getTask()
                    print("updated the task \(id)! completed Status: \(completed)")
                }
            }
            catch{
                print("error updating task \(id) to Realm: \(error)")
            }
        }
    }
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm{
            do{
                let tasktoDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@",id))
                guard !tasktoDelete.isEmpty else {return}
                try localRealm.write{
                    localRealm.delete(tasktoDelete)
                    getTask()
                    print("Deleted task With id: \(id)")
                }
            }
            catch{
                print("error deleting task \(id) to Realm: \(error)")
            }
        }
        
    }
    
}
