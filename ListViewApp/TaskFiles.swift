//
//  TaskFiles.swift
//  ListViewApp
//
//  Created by 西村映人 on 2020/09/06.
//  Copyright © 2020 西村映人. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


struct Task: Identifiable {
    var id = String()
    var taskItem = String()
}

class TaskList:ObservableObject{
    @Published var tasks = [Task]()
}

class nameList: ObservableObject {
    @Published var names:[String] = ["a","b","c","d","e",]
}
