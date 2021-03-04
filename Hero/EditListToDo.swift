//
//  EditListToDo.swift
//  Hero
//
//  Created by 月文 陈  on 2020/12/20.
//

import SwiftUI
import CoreData
struct EditListToDo: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    //需要传入的变量
    var todoItem: ToDoItem
    @State var updatedNeedTodo: String = ""
    var body: some View {
        List{
        VStack {
            Image("3").resizable().scaledToFit().clipShape(Circle()).frame(width:300,height:300,alignment: .center).shadow(radius:10).offset(x:0,y:0).padding(.bottom,-50)
            Text(updatedNeedTodo).padding()
            //此处修改内容
            TextField("Need to do...", text: $updatedNeedTodo)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            .onAppear(perform: {
                //每次显示该视图时赋值变量
                self.updatedNeedTodo = self.todoItem.needToDo ?? ""
            }).keyboardType(.default).padding()
            
        Button(action: {
            self.todoItem.needToDo = self.updatedNeedTodo
            
            do{
                try self.managedObjectContext.save()
            }catch
            {
                print(error)
            }
            //button按下后退出该视图
            self.presentationMode.wrappedValue.dismiss()
        })
        {
            Text("确定")
            
        }
        .buttonStyle(PlainButtonStyle()).padding()
            
        }
        }
    }
}


struct EditListToDo_Previews: PreviewProvider {
    static var previews: some View {
        EditListToDo(todoItem: ToDoItem())
    }
}
