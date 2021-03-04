//
//  LandMarkCell.swift
//  China-LanMark
//
//  Created by 月文 陈  on 2020/11/8.
//

import SwiftUI

struct LandMarkCell: View {
    let landMark:landMark
    var body: some View {
        
        HStack{
            Image(landMark.imageName).resizable().frame(width: 60, height: 60, alignment: .center).cornerRadius(15)
            Text(landMark.name)
            Spacer()
            if landMark.isFavorite{
                Image(systemName: "star.fill").padding().foregroundColor(.yellow).imageScale(.large)
            }
        }
    }
}

struct LandMarkCell_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkCell(landMark: landMarks[0])
    }
}
