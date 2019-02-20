//
//  GitTableViewController.swift
//  test
//
//  Created by big on 2019/2/19.
//  Copyright © 2019 big. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class GitTableViewController: UIViewController{

    let disposeBag = DisposeBag()
    
    var searchBar: UISearchBar!
    
    var tableView:UITableView!
    
    var viewModel: GitViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = UITableView(frame:self.view.frame, style:.plain)
        self.view.addSubview(self.tableView!)
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        self.searchBar = UISearchBar(frame: .init(x: 0, y: 0, width: self.view.bounds.size.width, height: 56))
        self.tableView.tableHeaderView = self.searchBar
        
        let searchAction = searchBar.rx.text.orEmpty.distinctUntilChanged().asObservable().debounce(0.5, scheduler: MainScheduler.instance)

        viewModel = GitViewModel(searchAction: searchAction)

        viewModel.navTitle.bind(to: self.navigationItem.rx.title).disposed(by: disposeBag)

//        viewModel.repositories.bind(to: tableView.rx.items) { tableView, row, element in
//            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
//            cell.textLabel?.text = element.name
//            cell.detailTextLabel?.text = element.html_url
//            return cell
//        }.disposed(by: disposeBag)
        
//tableView.rx.items(dataSource: <#T##RxTableViewDataSourceType & UITableViewDataSource#>)
        
        
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .play, target: nil, action: nil)
//            self.navigationItem.leftBarButtonItem = refreshButton
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        
//        let edit = UIBarButtonItem(barButtonSystemItem: .edit, target: nil, action: nil)

        self.navigationItem.rightBarButtonItems = [addButton, refreshButton]
        
        self.tableView.setEditing(true, animated: true)
        //表格模型
        let initialVM = TVModel()
        
        //刷新数据命令
        let refreshCommand = refreshButton.rx.tap.asObservable()
            .startWith(()) //加这个为了页面初始化时会自动加载一次数据
            .flatMapLatest(getRandomResult)
//            .flatMapLatest(viewModel.repositories.asSingle())
            .map(TableEditingCommand.setItems)
        
        //新增条目命令
        let addCommand = addButton.rx.tap.asObservable()
            .map{
//                "\(arc4random())"
                GitHubRepository()
            }
            .map(TableEditingCommand.addItem)
        
        //移动位置命令
        let movedCommand = tableView.rx.itemMoved
            .map(TableEditingCommand.moveItem)
        
        //删除条目命令
        let deleteCommand = tableView.rx.itemDeleted.asObservable()
            .map(TableEditingCommand.deleteItem)
        
        //绑定单元格数据
        Observable.of(refreshCommand, addCommand, movedCommand, deleteCommand)
            .merge()
            .scan(initialVM) { (vm: TVModel, command: TableEditingCommand)
                -> TVModel in
                return vm.execute(command: command)
            }
            .startWith(initialVM)
            .map {w in
                [MySection(header: "", items: w.items)]
//                []
            }
            .share(replay: 1)
            .bind(to: tableView.rx.items(dataSource: GitTableViewController.dataSource()))
            .disposed(by: disposeBag)
        
    }
    
    //获取随机数据
    func getRandomResult() -> Observable<[GitHubRepository]> {
        print("生成随机数据。")
//        let items = (0 ..< 5).map {_ in
//            "\(arc4random())"
//        }
//        return Observable.just(items)
        return viewModel!.repositories
    }
}

extension GitTableViewController {
    //创建表格数据源
    static func dataSource() -> RxTableViewSectionedAnimatedDataSource
        <MySection> {
            return RxTableViewSectionedAnimatedDataSource(
                //设置插入、删除、移动单元格的动画效果
                animationConfiguration: AnimationConfiguration(insertAnimation: .top,
                                                               reloadAnimation: .fade,
                                                               deleteAnimation: .left),
                configureCell: {
                    (dataSource, tv, indexPath, element) in
                    let cell = tv.dequeueReusableCell(withIdentifier: "Cell")!
//                    cell.textLabel?.text = "条目\(indexPath.row)：\(element)"
                    cell.textLabel?.text = element.name
                    cell.detailTextLabel?.text = element.html_url
                    return cell
            },
                canEditRowAtIndexPath: { _, _ in
                    return true //单元格可删除
            },
                canMoveRowAtIndexPath: { _, _ in
                    return true //单元格可移动
            }
            )
    }
}
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
