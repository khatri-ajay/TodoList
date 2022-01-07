//
//  AddTaskButton.swift
//  TodoList
//
//  Created by Ajay Kumar on 07/01/2022.
//

import SwiftUI

struct AddTaskButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50)
                .foregroundColor(Color(red: 0.334, green: 0.314, blue: 0.301))
            
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
            
        }
        .frame(height: 50)
    }
}

struct AddTaskButton_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskButton()
    }
}
