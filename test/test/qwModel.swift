//
//  Created File to 2019-02-18 15:55:34
//
//
//  Created by 孙凌锋   https://github.com/SLingFeng
//  Copyright © 2017年 孙凌锋. All rights reserved.
//  Reference
//      Automatic Coder https://github.com/zhangxigithub/AutomaticCoder
//      AutomaticCoder(修改版) https://github.com/yinxianwei/AutomaticCoder-
//
//  Created by 孙凌锋 on 2017/11/24.


import UIKit
import HandyJSON


class qwResultsModel: HandyJSON {
    
    var artworkUrl30 : NSString?

    var artworkUrl60 : NSString?

    var artistViewUrl : NSString?

    var artistId = NSNumber()

    var primaryGenreName : NSString?

    var country : NSString?

    var releaseDate : NSString?

    var artistName : NSString?

    var wrapperType : NSString?

    var trackTimeMillis = NSNumber()

    var trackPrice = NSNumber()

    var currency : NSString?

    var trackId = NSNumber()

    var collectionExplicitness : NSString?

    var trackCensoredName : NSString?

    var trackName : NSString?

    var artworkUrl100 : NSString?

    var previewUrl : NSString?

    var collectionPrice = NSNumber()

    var trackViewUrl : NSString?

    var kind : NSString?

    var trackExplicitness : NSString?

     

    required init() {

    }
}
class qwModel: HandyJSON {
    
    var results : [qwResultsModel]?

     

    required init() {

    }
}
