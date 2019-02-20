//
//  GitViewModel.swift
//  test
//
//  Created by big on 2019/2/19.
//  Copyright © 2019 big. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

//定义各种操作命令
enum TableEditingCommand {
    case setItems(items: [GitHubRepository])  //设置表格数据
    case addItem(item: GitHubRepository)  //新增数据
    case moveItem(from: IndexPath, to: IndexPath) //移动数据
    case deleteItem(IndexPath) //删除数据
}

class GitViewModel {

    fileprivate let searchAction: Observable<String>

    let searchResult: Observable<GitModel>
    
    let repositories: Observable<[GitHubRepository]>

    let cleanResult: Observable<Void>
    
    let navTitle : Observable<String>
    
    
    init(searchAction: Observable<String>) {
        
        self.searchAction = searchAction
        self.searchResult = searchAction.filter{!$0.isEmpty}.flatMapFirst(TableViewModel().searchRepositories).share(replay: 1)
        
        self.cleanResult = searchAction.filter{ $0.isEmpty }.map{ _ in Void()}
        
        self.repositories =  Observable.of(searchResult.map{ $0.items }, cleanResult.map{ [] }).merge()
        
        self.navTitle = Observable.of(
            searchResult.map{ "共有 \($0.total_count!) 个结果" },
            cleanResult.map{"hangge.com"})
            .merge()
    }
    
    
    
    
}

//定义表格对应的ViewModel
struct TVModel {
    //表格数据项
    var items:[GitHubRepository]
//    var header: String
//    var arr: [GitHubRepository]
    
    
    init(items: [GitHubRepository] = []) {
        self.items = items
//        self. = items
    }
    
    //执行相应的命令，并返回最终的结果
    func execute(command: TableEditingCommand) -> TVModel {
        switch command {
        case .setItems(let items):
            print("设置表格数据。")
            return TVModel(items: items)
        case .addItem(let item):
            print("新增数据项。")
            var items = self.items
            items.append(item)
            return TVModel(items: items)
        case .moveItem(let from, let to):
            print("移动数据项。")
            var items = self.items
            items.insert(items.remove(at: from.row), at: to.row)
            return TVModel(items: items)
        case .deleteItem(let indexPath):
            print("删除数据项。")
            var items = self.items
            items.remove(at: indexPath.row)
            return TVModel(items: items)
        }
    }
}

struct MySection {
    var header: String
    var items: [Item]
}

extension MySection : AnimatableSectionModelType {
    typealias Item = GitHubRepository
    
    var identity: String {
        return header
    }
    
    init(original: MySection, items: [Item]) {
        self = original
        self.items = items
    }
}

extension GitHubRepository: IdentifiableType, Equatable {
    typealias Identity = Int
    
    var identity : Identity { return id }
}

func ==(lhs: GitHubRepository, rhs: GitHubRepository) -> Bool {
    return lhs.id == rhs.id
}
