//
//  TaskView.swift
//  TodoList
//
//  Created by Ajay Kumar on 07/01/2022.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var realManger: RealmManager
    var body: some View {
        VStack {
            Text("My Task")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
           
            List {
                ForEach(realManger.tasks,id: \.id){
                    task in
                    if !task.isInvalidated{
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realManger.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing){
                                Button(role: .destructive){
                                    realManger.deleteTask(id: task.id)
                                    
                                    
                                } label: {
                                    Label("Delete",systemImage: "trash")
                                }
                            }
                    }
                    
                }
                .listRowSeparator(.hidden)
            }
            .onAppear{
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            
          
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color(hue: 1.0, saturation: 0.469, brightness: 0.972))
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(RealmManager())
    }
}
