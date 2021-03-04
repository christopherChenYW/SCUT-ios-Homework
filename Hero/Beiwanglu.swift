//
//  Beiwanglu.swift
//  Hero
//
//  Created by 月文 陈  on 2020/12/18.
//

import SwiftUI

struct Beiwanglu: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: ToDoItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItem.needToDo, ascending: true)]) var toDoItems : FetchedResults<ToDoItem>
    @State private var thingsToDo = ""
    @State private var showFinishedFlag = false
    //判断是否显示checkmark
    func image(for state: Bool) -> Image {
            return state ? Image(systemName: "checkmark.circle") : Image(systemName: "circle")
        }
    var body: some View {
        NavigationView{
            List
                {
                        //待输入
                        Section(header: Text("笔记书写"))
                        {
                            HStack {
                                TextField("请输入你的笔记", text: $thingsToDo)
                                Button(action: {
                                    let newThing = ToDoItem(context: self.managedObjectContext)
                                    newThing.needToDo = self.thingsToDo
                                    newThing.showFlag = false
                                    
                                    do
                                    {
                                        try  self.managedObjectContext.save()
                                    }catch
                                    {
                                        print(error)
                                    }
                                    
                                    self.thingsToDo = ""
                                    
                                })
                                {
                                    Text("✓")
                                        .font(.headline)
                                }
                            }
                        }
                        //显示已经输入完成的内容
                        Section(header: Text("英雄笔记"))
                        {
                            ForEach(toDoItems, id: \.self)
                            {
                                item in
                                
                                HStack {
                                    self.image(for: item.showFlag).onTapGesture {
                                        item.showFlag.toggle()
                                        do
                                        {
                                            try  self.managedObjectContext.save()
                                        }catch
                                        {
                                            print(error)
                                        }
                                    }
                                    Text(item.needToDo!)
                                    NavigationLink(destination: EditListToDo(todoItem: item))
                                    {
                                       Text("\(item.needToDo ?? "")")
                                      }
                                }
                            }.onDelete(perform: { indexSet in
                                let itemToDoDelete = self.toDoItems[indexSet.first!]
                                self.managedObjectContext.delete(itemToDoDelete)
                                
                                do{
                                    try self.managedObjectContext.save()
                                } catch {
                                    print(error)
                                }
                            })
                        }
                }.navigationTitle("英雄笔记")
                .navigationBarItems(trailing: EditButton())
        }
        
    }
}

struct Beiwanglu_Previews: PreviewProvider {
    static var previews: some View {
        Beiwanglu()
    }
}
//Section(header: Text("要做的事"))
//                        {
//                            ForEach(toDoItems)
//                            {
//                                item in
//
//                                HStack {
//                                    self.image(for: item.showFlag).onTapGesture {
//                                        item.showFlag.toggle()
//                                        do
//                                        {
//                                            try  self.managedObjectContext.save()
//                                        }catch
//                                        {
//                                            print(error)
//                                        }
//                                    }
//                                    NavigationLink(destination: EditListToDo(todoItem: item))
//                                        {
//                                            Text("\(item.needToDo ?? "")")
//
//                                    }
//                                }
//
//                            }.onDelete { (indexSet) in
//                                let itemToDelete = self.toDoItems[indexSet.first!]
//                                self.managedObjectContext.delete(itemToDelete)
//
//                                do {
//                                    try self.managedObjectContext.save()
//                                } catch {
//                                    print(error)
//                                }
//                            }
//
//
//                        }
//                }
//                .navigationBarTitle("待办清单")
//                .navigationBarItems(trailing: EditButton())
