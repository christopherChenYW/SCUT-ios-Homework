//
//  landmarkList.swift
//  China-LanMark
//
//  Created by 月文 陈  on 2020/11/8.
//

import SwiftUI

struct landmarkList: View {
    @State var flag:Bool=false
    @EnvironmentObject var userdata:UserData
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn:.constant(flag ? true:false), label: {
                    Text("只展示收藏")
                }).onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    withAnimation(){
                        self.flag.toggle()
                    }
                })
                ForEach(userdata.userlandMarks){
                    item in
                    if !self.flag||item.isFavorite
                    {
                        NavigationLink(destination:landMarkDetail(landMark: item).environmentObject(userdata)){
                                LandMarkCell(landMark: item)
                            }
                    
                    }
                    
                }
                    }.navigationBarTitle(Text("所有英雄"))
            }
        }
    }

struct landmarkList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            landmarkList().environmentObject(UserData())
        }
    }
}
