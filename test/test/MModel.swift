//
//  MModel.swift
//  test
//
//  Created by big on 2019/2/12.
//  Copyright © 2019 big. All rights reserved.
//

import UIKit
import HandyJSON
import RxSwift
import RxCocoa
import RxAtomic
//import RxDataSources

class MModel: HandyJSON {
    
    var results = [MSubModel]()
    var asxz = [Observable<MSubModel>]()
    required init() {}
}

class MSubModel: HandyJSON {
    var artistId: String?
    var artistName: String?
    var trackName: String?
    var qwer: String = ""
    var asdf: String = ""

    var zxc: Observable<String>?
    
    
    required init() {
        
    }
}

//struct LXFSection {
//    
//    var items: [Item]
//}
//
//extension LXFSection: SectionModelType {
//    
//    typealias Item = MSubModel
//    
//    init(original: LXFSection, items: [LXFSection.Item]) {
//        self = original
//        self.items = items
//    }
//}
