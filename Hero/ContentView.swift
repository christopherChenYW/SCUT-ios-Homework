//
//  Home.swift
//  China-LanMark
//
//  Created by 月文 陈  on 2020/11/9.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userdata:UserData
    private var categories:[String:[landMark]]{
        Dictionary(grouping: landMarks, by: {$0.category})
    }
    @State var isPresented=false
    var body: some View {
        NavigationView{
            List{
                PageVC().frame(height:200).listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self){
                    categoryName in
                    categoriesCell(categoryName: categoryName, landmarks: self.categories[categoryName]!)
                }.listRowInsets(EdgeInsets())
                
                Button("英雄笔记", action:{self.isPresented.toggle()}).sheet(isPresented: $isPresented){
                                Beiwanglu()
                                }.animation(.easeIn)
                
                Button("个人中心", action:{self.isPresented.toggle()}).sheet(isPresented: $isPresented){
                                datashow()
                                }.animation(.easeIn)
               
                NavigationLink(destination:landmarkList().environmentObject(userdata)){
                  Text("展示所有英雄")
                }

            }.navigationTitle(Text("王者营地"))
        }
    }
}
//.navigationBarItems(trailing:Button(action:{self.isPresented.toggle()}){Image(systemName:"person.crop.circle").foregroundColor(.blue).imageScale(.large).padding()}).sheet(isPresented: $isPresented){
//    datashow()
//    }
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData())
    }
}

struct categoriesCell: View {
    let categoryName:String
    let landmarks:[landMark]
    var body: some View {
        VStack(alignment:.leading){
            Text(categoryName).font(.headline)
            ScrollView(.horizontal,showsIndicators:false){
                HStack(spacing:15) {
                    ForEach(self.landmarks){
                        landmark in
                        NavigationLink(destination: landMarkDetail(landMark: landmark))
                            {
                                VStack(alignment:.center) {
                                    Image(landmark.imageName).resizable().frame(width:100,height:100).scaledToFit().cornerRadius(10).clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white,lineWidth: 4))
                                        .shadow(radius: 3)
                                    Text(landmark.name).font(.caption).padding(.top,5)
                                }
                        }
                    }
                }
            }
        }.padding(.leading,15).padding([.top,.bottom],8)
    }
}

