//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var restaurant = ["咖啡胡同","霍米","茶。家","洛伊斯咖啡","贝蒂生蚝","福奇餐馆","阿波画室","小碗大胃","虾吃虾涮","福厨","纸上烤鱼",
                  "伯克街面包坊","嘉华饼屋","黑氏巧克力","惠灵顿雪梨","布鲁克林塔菲","格雷厄姆大街肉","华夫饼 & 沃夫","眼光咖啡","震颤酒吧","巴拉菲娜","多尼西亚","皇家橡树","秦咖啡"]

var rType = ["西餐","西餐","中餐","西餐","海鲜","广式","休闲","中餐","火锅","中餐","烧烤",
             "糕点","糕点","零食","水果","西餐","烤肉","面包","饮品","休闲","西餐","西餐","中餐","饮品"]

var rLocation = ["上海","北京","杭州","西南","海南","广州","西安","大理","丽江","昆明","西双版纳",
                 "会泽","曲靖","宜昌","武汉","长沙","贵阳","成都","重庆","施恩","长阳","陆良","大海草上","呼和浩特"]

var rImg = ["0","1","2","3","4","5","06","07","08","09","010","011","012","013","014","015","016","017","018","019","020","021","022","023","024"]

var status = [Bool](count:25, repeatedValue:false)

for i in 0..<restaurant.count {
    print("Restaurant(name:\"\(restaurant[i])\",type:\"\(rType[i])\",location:\"\(rLocation[i])\",image:\"\(rImg[i])\",isVisited:\(status[i]))",",")
}