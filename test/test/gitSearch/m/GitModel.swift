//
//  GitModel.swift
//  test
//
//  Created by big on 2019/2/19.
//  Copyright © 2019 big. All rights reserved.
//

import UIKit

class GitModel: LFBaseModel {
    var total_count: Int!
    var incomplete_results: Bool!
    var items: [GitHubRepository]! //本次查询返回的所有仓库集合
    
    
}

class GitHubRepository: LFBaseModel {
    var id: Int!
    var name: String!
    var full_name:String!
    var html_url:String!
    var description:String!
    
}
