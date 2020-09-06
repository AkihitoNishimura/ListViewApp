//
//  ContentView.swift
//  ListViewApp
//
//  Created by 西村映人 on 2020/09/06.
//  Copyright © 2020 西村映人. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var nList = nameList()
    
    @ObservedObject var tList = TaskList()
    
    @State var newTask:String = ""
    
    var addTaskBar : some View{
        HStack{
            TextField("追加してください",text:self.$newTask)
            Button(action: self.addNewTask, label: {Text("add")})
        }
    }
    
    func addNewTask(){
        tList.tasks.append(Task(id:String(tList.tasks.count+1),taskItem: newTask))
        self.newTask=""
    }
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    addTaskBar.padding()
                    List {
                        ForEach(self.tList.tasks){
                            Index in Text(Index.taskItem)
                        }
                        .onDelete(perform: rowRemove)
                    }
                .navigationBarItems(trailing: EditButton())
                .navigationBarTitle("Taskリスト")
                }
            }
        }
        
    }

    func rowRemove(offsets: IndexSet) {
        self.tList.tasks.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
