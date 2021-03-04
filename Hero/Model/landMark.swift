//
//  File.swift
//  China-LanMark
//
//  Created by 月文 陈  on 2020/11/8.
//

import SwiftUI
import  CoreLocation
struct landMark:Identifiable{
    var id:Int
    var category:String
    var name:String
    var city:String
    var province:String

    var latitude:Double
    var longtitude:Double
    var locationCoordinate:CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
    }
    var imageName:String
    var isFavorite:Bool
    var isFeatured:Bool
    var detail:String
}
let landMarks=[
    landMark(id:1,category: "法师",name: "高渐离",city: "定兴县",province: "河南省",latitude: 39.9087243,longtitude: 116.38528,imageName: "gaojianli",isFavorite: false,isFeatured: false,detail:"说起大陆最传奇的乐师，人们一定会提到高渐离的名字爱情与死亡永恒的乐章。"),
    landMark(id:2,category: "法师",name: "嫦娥",city: "广寒宫",province: "月球",latitude: 39.9087243,longtitude: 116.38528,imageName: "change",isFavorite: false,isFeatured: false,detail:"嫦娥北境严寒但必须无休止的工作日之塔才能亮起为倒悬都市打上那束耀眼的长光魔道一族运用极高的天赋转化这门艺术让神的塑像中出现了奇怪的神情魔种本能地对那些塑像产生了恨变得不太驯服当神职者的汇报里出现魔种之间流传笑话时那位神的眼睛亮了当然并不是为魔种高兴精明的神亲自到了日之塔中在神职者的护卫下巡视了一圈或许是他多虑了这里只有蠢人的小小骚动聪明人仍然在替他们工作问题很快就会过去他告知神职者要除掉的不是魔种而是那些安安静静干着细活的人大火烧进村庄箭雨划过天空绝不放过任何一个活的东西她的兔子她的伙伴她奔跑过去却被父亲抱走十来天后最后的逃亡者也被捕获他们衣衫破损伤口流着血被拖上日之塔处刑银色头发在夜里发出黯淡的光随后的情况有些意外箭击在脖子上的玉佩产生了一个小小的爆炸被行刑的最后这个小女孩消失了那位最强的弓箭手因失手而被立即逮捕与此同时月光透入水下唤醒着一具几乎濒死的身体是否该谴责自己她感到自己的眼泪却无法触摸它们和冰冷的水光融在了一起紧接着月光朝她涌入了仿佛难以控制的巨大能量她睁开眼睛虽然不知道接下来会发生什么但她决心抓住那块渐行渐远的玉佩"),
    landMark(id:3,category: "战士",name: "宫本武藏",city: "日本",province: "大和民族",latitude: 39.9087243,longtitude: 116.38528,imageName: "gongbenwuzang",isFavorite: false,isFeatured: true,detail:"宫本武藏听说武道大会可是高手如云特别是今年的冠军扶桑也有很厉害的人物有个叫宫本武藏的左手一把长刀右手一把短剑神挡杀神魔挡杀魔取过的人头比吃过的米还多是啊我就是那个武藏你还知道什么值得我挑战的对手吗告诉你个秘密我是无敌的"),
    landMark(id:4,category: "坦克",name: "廉颇",city: "战果四大名将",province: "河北省",latitude: 39.9087243,longtitude: 116.38528,imageName: "lianpo",isFavorite: false,isFeatured: true,detail:"说起大陆最传奇的乐师，人们一定会提到高渐离的名字爱情与死亡永恒的乐章。"),
    landMark(id:5,category: "战士",name: "盘古",city: "传说人物",province: "生于混沌",latitude: 39.9087243,longtitude: 116.38528,imageName: "pangu",isFavorite: false,isFeatured: true,detail:""),
    landMark(id:6,category: "法师",name: "上官婉儿",city: "才女",province: "河南省",latitude: 39.9087243,longtitude: 116.38528,imageName: "shangguanwaner",isFavorite: false,isFeatured: true,detail:""),
    landMark(id:7,category: "射手",name: "孙尚香",city: "孙权之妹",province: "三国人物",latitude: 39.9087243,longtitude: 116.38528,imageName: "sunshangxiang",isFavorite: false,isFeatured: true,detail:"说起大陆最传奇的乐师，人们一定会提到高渐离的名字爱情与死亡永恒的乐章。"),
    landMark(id:8,category: "法师",name: "小乔",city: "东汉末年美女",province: "三国人物",latitude: 39.9087243,longtitude: 116.38528,imageName: "xiaoqiao",isFavorite: false,isFeatured: true,detail:""),
    landMark(id:9,category: "辅助",name: "庄周",city: "道家学派创始人",province: "战国",latitude: 39.9087243,longtitude: 116.38528,imageName: "zhuangzhou",isFavorite: true,isFeatured: true,detail:""),
    landMark(id:10,category: "坦克",name: "猪八戒",city: "天蓬元帅",province: "传说人物",latitude: 39.9087243,longtitude: 116.38528,imageName: "zhubajie",isFavorite: true,isFeatured: true,detail:"说起大陆最传奇的乐师，人们一定会提到高渐离的名字爱情与死亡永恒的乐章。"),
    landMark(id:11,category: "刺客",name: "李白",city: "诗仙",province: "唐朝",latitude: 39.9087243,longtitude: 116.38528,imageName: "libai",isFavorite: false,isFeatured: true,detail:""),
    landMark(id:12,category: "战士",name: "李信",city: "秦国名将",province: "战国",latitude: 39.9087243,longtitude: 116.38528,imageName: "lixin",isFavorite: false,isFeatured: true,detail:""),
    landMark(id:13,category: "刺客",name: "兰陵王",city: "徐州",province: "北齐",latitude: 39.9087243,longtitude: 116.38528,imageName: "lanlinwang",isFavorite: false,isFeatured: true,detail:"说起大陆最传奇的乐师，人们一定会提到高渐离的名字爱情与死亡永恒的乐章。"),
    landMark(id:14,category: "辅助",name: "瑶",city: "鹿",province: "捏造人物",latitude: 39.9087243,longtitude: 116.38528,imageName: "yao",isFavorite: false,isFeatured: true,detail:""),
    landMark(id:15,category: "刺客",name: "元歌",city: "傀儡师",province: "捏造人物",latitude: 39.9087243,longtitude: 116.38528,imageName: "yuange",isFavorite: false,isFeatured: true,detail:""),
    landMark(id:18,category: "刺客",name: "阿轲",city: "荆轲的妹妹",province: "战国",latitude: 39.9087243,longtitude: 116.38528,imageName: "ake",isFavorite: false,isFeatured: true,detail:"阿轲自古以来在暗夜中隐藏着神秘的刺客一族荆氏当这一族只剩下最后相依为命的兄妹二人的时候兄长继承了荆轲的名号白日里混迹街头与市井无赖为伍夜幕降临时则化身为致命杀手落魄的流浪者竟然取代孤成为止战的首领不可容忍荆轲产生了生平第一次犹豫豪爽的樊於期与年轻的刺客荆轲不知不觉间早已超越身份的差距结为好友最终他拒绝了这笔生意荆轲叹息着提剑走向了残忍的凶手生命的最后一刻他想到的是小妹自己死去后家族的命运将降临到少女的身上然而众人的惊叹声中闪烁着寒光的利刃袭来宣示着代代传承的刺客荆轲并不因一人的死去而死去太子丹的侍卫彻夜搜索着大胆的刺客却不知宴会的乐师已将她带走"),
    landMark(id:16,category: "坦克",name: "盾山",city: "机器人",province: "捏造人物",latitude: 39.9087243,longtitude: 116.38528,imageName: "dunshan",isFavorite: false,isFeatured: true,detail:"盾山，是手游《王者荣耀》中的一位英雄角色，于2018年9月7日正式服上线。原型是唐朝军阀安禄山。拥有能格挡弹道，并且击退敌人的技能，同时还可通过被动修复防御塔"),
    landMark(id:17,category: "战士",name: "赵云",city: "赵子龙",province: "三国人物",latitude: 39.9087243,longtitude: 116.38528,imageName: "zhaoyun",isFavorite: false,isFeatured: true,detail:"赵云长久以来佣兵辗转于不同主人之间,用血肉之躯为自己赢得一席之地,朝不保夕危险背叛和死亡都是家常便饭,那就是影子龙长久以来最亲密的助手和朋友,失去同伴的龙决定采纳曹操的建议用秘法来对抗吕布,然而战神就是战神,即便落入陷阱,数年后曹操的大军席卷了三分之地却在长坂坡遭遇前,所未有的重挫惊天动地的雷霆涤荡着曹军,引以自豪的名将影子已死赵子龙参见。"),
]
let     featurelandmarks=[landMark(id:100,category: "战士",name: "赵云",city: "赵子龙",province: "三国人物",latitude: 39.9087243,longtitude: 116.38528,imageName: "1",isFavorite: false,isFeatured: true,detail:""),landMark(id:101,category: "战士",name: "赵云",city: "赵子龙",province: "三国人物",latitude: 39.9087243,longtitude: 116.38528,imageName: "2",isFavorite: false,isFeatured: true,detail:""),landMark(id:102,category: "战士",name: "赵云",city: "赵子龙",province: "三国人物",latitude: 39.9087243,longtitude: 116.38528,imageName: "3",isFavorite: false,isFeatured: true,detail:""),landMark(id:103,category: "战士",name: "赵云",city: "赵子龙",province: "三国人物",latitude: 39.9087243,longtitude: 116.38528,imageName: "4",isFavorite: false,isFeatured: true,detail:"")]
let     favoritelandmarks=landMarks.filter{$0.isFavorite}

struct landMark_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
