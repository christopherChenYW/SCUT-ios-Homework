//
//  SwiftUIView.swift
//  China-LanMark
//
//  Created by 月文 陈  on 2020/11/10.
//

import SwiftUI
import CoreData

struct datashow: View {
    private var dataformatter:DateFormatter{
        let dataformatter=DateFormatter()
        dataformatter.dateFormat="yyyy年M月d日"
        return dataformatter
    }
    @Environment(\.editMode) var mode
    @State var profile=User.default
    @State var profileCopy=User.default
    
    var body: some View {
        VStack{
            HStack {
                if mode?.wrappedValue == .active
                {
                    Button(action: {
                        self.profile=self.profileCopy
                        self.mode?.animation().wrappedValue = .inactive
                        print("hh")
                    }) {
                    Text("完成")
                }
                }
                Spacer()
                EditButton()
            }.padding()
            if mode?.wrappedValue == .inactive {
                VStack(alignment:.trailing) {
                    VStack(){
                        VStack(alignment:.center,spacing:10){
                            Image("2").resizable().scaledToFit().clipShape(Circle()).frame(width:300,height:300,alignment: .center).shadow(radius:10).offset(x:0,y:0).padding(.bottom,-50)
                            Text(profile.username).font(.title).bold()
                        }
                        List{
                            Text("允许通知: \(profile.prefersNotifications ? "是":"否")")
                            Text("喜欢的季节: \(profile.preferSeason.rawValue)")
                            Text("生日：\(dataformatter.string(from: profile.birthday))")
                        }
                    }
                }
            }else{
                List{
                HStack{
                    Text("昵称")
                    Divider()
                    TextField("昵称", text: $profileCopy.username)
                }
                Toggle(isOn: $profileCopy.prefersNotifications){
                    Text("允许通知")
                }
                VStack(alignment:.leading){
                    Text("喜欢的季节").bold()
                    Picker("喜欢的季节", selection: $profileCopy.preferSeason) {
                        ForEach(User.Season.allCases,id: \.self) { season in
                            Text(season.rawValue).tag(season)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }.padding(.top)
                VStack{
                    DatePicker("生日",selection: $profileCopy.birthday,displayedComponents: .date)

                }.padding(.top)
            }.onDisappear{
                self.profileCopy = self.profile
            }
            }
        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        datashow()
    }
}
