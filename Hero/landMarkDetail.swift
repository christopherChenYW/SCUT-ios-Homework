//
//  landMarkDetail.swift
//  China-LanMark
//
//  Created by 月文 陈  on 2020/11/8.
//

import SwiftUI

struct landMarkDetail: View {
    let landMark:landMark
    var landMarkIndex:Int{
        return userdata.userlandMarks.firstIndex(where: {return $0.id==landMark.id})!
    }
    @State private var isBig=false
    @EnvironmentObject var userdata:UserData
    var body: some View {
        ScrollView(.vertical){
        VStack {
            MapView(center: landMark.locationCoordinate).edgesIgnoringSafeArea(.top).frame(height:400)
            Image(landMark.imageName).resizable().frame(width:isBig ? 300: 200, height: isBig ? 300:200, alignment: .center).clipShape(Circle()).overlay(Circle().stroke(Color.white,lineWidth: 4)).shadow(radius: 10)
                .offset(x:0,y:-200)
                .padding(.bottom,-200)
                .onTapGesture(count: 1, perform: {
                    withAnimation(){
                        isBig.toggle()
                    }
                })
            VStack(alignment:.leading,spacing:8){
                HStack {
                    Text(landMark.name).font(.title).padding(.leading)
                    Button(action: {
                        self.userdata.userlandMarks[landMarkIndex].isFavorite.toggle()
                    }){
                        Image(systemName:self.userdata.userlandMarks[landMarkIndex].isFavorite ?"star.fill": "star").foregroundColor(self.userdata.userlandMarks[landMarkIndex].isFavorite ? .yellow:.gray)
                    }
                }
                VStack(spacing:5){
                    HStack {
                        Text(landMark.city).font(.subheadline).foregroundColor(.secondary)
                        Spacer()
                        Text(landMark.province).font(.subheadline).foregroundColor(.secondary)
                    }.padding(.leading).padding(.bottom).padding(.trailing)
                    Text(landMark.detail).padding().font(.subheadline).foregroundColor(.black)
                    VStack{
                        HStack{
                            Text("生存能力：                          ")
                            Image(systemName:"star.fill").foregroundColor( .red)
                            Image(systemName:"star.fill").foregroundColor( .red)
                            Image(systemName:"star.fill").foregroundColor( .red)
                            Image(systemName:"star.fill").foregroundColor( .red)
                            Image(systemName:"star").foregroundColor( .gray)
                            Image(systemName:"star").foregroundColor( .gray)
                        }.padding(.trailing).padding(.leading).padding(.top)
                        HStack{
                            Text("攻击伤害：                          ")
                            Image(systemName:"star.fill").foregroundColor( .red)
                            Image(systemName:"star.fill").foregroundColor( .red)
                            Image(systemName:"star").foregroundColor( .gray)
                            Image(systemName:"star").foregroundColor( .gray)
                            Image(systemName:"star").foregroundColor( .gray)
                            Image(systemName:"star").foregroundColor( .gray)
                        }.padding(.trailing).padding(.leading)
                        HStack{
                            Text("技能效果：                          ")
                            Image(systemName:"star.fill").foregroundColor( .red)
                            Image(systemName:"star.fill").foregroundColor( .red)
                            Image(systemName:"star.fill").foregroundColor( .red)
                            Image(systemName:"star").foregroundColor( .gray)
                            Image(systemName:"star").foregroundColor( .gray)
                            Image(systemName:"star").foregroundColor( .gray)
                        }.padding(.trailing).padding(.leading)
                        HStack{
                            Text("上手难度：                          ")
                            Image(systemName:"star.fill").foregroundColor( .red)
                            Image(systemName:"star.fill").foregroundColor( .red)
                            Image(systemName:"star").foregroundColor( .gray)
                            Image(systemName:"star").foregroundColor( .gray)
                            Image(systemName:"star").foregroundColor( .gray)
                            Image(systemName:"star").foregroundColor( .gray)
                        }.padding(.trailing).padding(.leading).padding(.bottom)
                    }.border(Color.gray)
                    
                }
                HStack{
                    Image(systemName:"book.fill").foregroundColor(.yellow)
                    Text("技能介绍").font(.title)
                }.padding(.leading)
                VStack{
                    HStack{
                        Image(systemName:"doc.on.clipboard").foregroundColor(.purple)
                        Text("哀歌").font(.title2)
                        Spacer()
                        Text(" 冷却值：0消耗：0")
                    }.padding(.trailing)
                    Text("被动：高渐离的普通攻击或释放技能可视作一次演奏，每三次演奏后的下一次普通攻击将会向目标弹奏出带有击穿效果的能量和弦，造成280/300/320/340/360/380（+80%法术加成）的法术伤害。").font(.subheadline).padding(.bottom).padding(.trailing)
                    
                    HStack{
                        Image(systemName:"doc.on.clipboard").foregroundColor(.purple)
                        Text("狂歌").font(.title2)
                        Spacer()
                        Text(" 冷却值：7消耗：80")
                    }.padding(.trailing)
                    Text("高渐离弹奏出音符，锁定附近至多2名敌人造成350/410/470/530/590/650（+47%法术加成）点法术伤害；音符命中敌人后，会向附近的敌人进行弹射，音符至多弹射2次；当多个音符命中同一目标时，从第二个音符开始将只造成30%伤害。").font(.subheadline).padding(.bottom).padding(.trailing)
                    
                    HStack{
                        Image(systemName:"doc.on.clipboard").foregroundColor(.purple)
                        Text("魔音贯耳").font(.title2)
                        Spacer()
                        Text(" 冷却值：45/40/35消耗：140")
                    }.padding(.trailing)
                    Text("高渐离释放激情，每0.5秒进行一次演奏，对附近敌人造成200/275/350（+25%法术加成）点法术伤害，持续5秒；演奏持续时自身会减少15%所受到的伤害，并且附近每个敌方英雄还将减少高渐离5%所收到的伤害；并且在演奏开始时自身会增加70%持续衰减的移动速度，持续3秒。").font(.subheadline).padding(.bottom).padding(.trailing)
                    
                    HStack{
                        Image(systemName:"doc.on.clipboard").foregroundColor(.purple)
                        Text("离歌").font(.title2)
                        Spacer()
                        Text(" 冷却值：10/9.4/8.8/8.2/7.6/7消耗：70")
                    }.padding(.trailing)
                    Text("高渐离震慑琴弦，对附近敌人造成500/560/620/680/740/800（+65%法术加成）点法术伤害并减少其35%/40%/45%/50%/55%/60%移动速度，持续2秒，每命中一个英雄将回复125/140/155/170/185/200(+16%法术加成）生命值。").font(.subheadline).padding(.bottom).padding(.trailing)
                }.padding(.leading)
            }
            Spacer()
        }.navigationBarTitle(Text(landMark.name),displayMode: .inline)
        }.animation(.interactiveSpring())}
    
}
    

struct landMarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            landMarkDetail(landMark: landMarks[0]).environmentObject(UserData())
        }
    }
}
