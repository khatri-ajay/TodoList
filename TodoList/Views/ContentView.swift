//
//  ContentView.swift
//  TodoList
//
//  Created by Ajay Kumar on 07/01/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var realManger = RealmManager()
    @State private var showAddTaskView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            TaskView()
                .environmentObject(realManger)
            AddTaskButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
            
        }
        .sheet(isPresented: $showAddTaskView){
            AddTaskView()
                .environmentObject(realManger)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
        .background(Color(hue: 1.0, saturation: 0.469, brightness: 0.972))

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
