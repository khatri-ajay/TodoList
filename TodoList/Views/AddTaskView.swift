//
//  AddTaskView.swift
//  TodoList
//
//  Created by Ajay Kumar on 07/01/2022.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realManger : RealmManager
    @State private var title : String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Create a new task")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter your task here",text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button {
                if title != ""{
                    realManger.addTask(taskTitle: title)
                    
                }
                dismiss()
            }label: {
                Text( "Add Task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(red: 0.334, green: 0.314, blue: 0.301))
                    .cornerRadius(40)
            }
            
            Spacer()
            
        }
        .padding(.top,40)
        .padding(.horizontal)
        .background(Color(hue: 1.0, saturation: 0.469, brightness: 0.972))

    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
