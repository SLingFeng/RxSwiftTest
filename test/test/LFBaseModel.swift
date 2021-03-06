//
//  LFBaseModel.swift
//
//
//  Created by big on 2019/2/15.
//  Copyright © 2019 big. All rights reserved.
//

import UIKit
import HandyJSON
import NSObject_Rx
import RxCocoa
import RxSwift
import Moya

class LFBaseModel: HandyJSON {

    required init() {
        
    }
}

class LFResponseModel: NSObject, HandyJSON {
    /**
     状态码
     */
    var code: NSInteger = 0
    /**
     信息
     */
    var msg = ""
    
    var arr = ["s", "sdf"]
    
    
    var success: Bool = false

    required override init() {
        super.init()
    }
}

//这里是为 RxSwift 中的 ObservableType和 Response写一个简单的扩展方法 mapModel，利用我们写好的Model 类，一步就把JSON数据映射成 model
//extension ObservableType where E == Response {
//    public func mapModel<T: HandyJSON>(_ type: T.Type) -> Observable<T> {
//        return flatMap { response -> Observable<T> in
//            return Observable.just(response.mapModel(T.self))
//        }
//    }
//}
//
//extension Response {
//    func mapModel<T: HandyJSON>(_ type: T.Type) -> T {
//        let jsonString = String.init(data: data, encoding: .utf8)
//        return JSONDeserializer<T>.deserializeFrom(json: jsonString)!
//    }
//}

//扩展Moya支持HandyJSON的解析
extension ObservableType where E == Response {
    public func mapModel<T: HandyJSON>(_ type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(response.mapModel(T.self))
        }
    }
}
extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) -> T {
        let jsonString = String.init(data: data, encoding: .utf8)
        if let modelT = JSONDeserializer<T>.deserializeFrom(json: jsonString) {
            return modelT
        }
        return JSONDeserializer<T>.deserializeFrom(dict : ["msg" : "请求有误"])!
    }
}
//链接：https://www.jianshu.com/p/97a476c71678

