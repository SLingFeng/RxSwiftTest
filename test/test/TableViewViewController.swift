//
//  TableViewViewController.swift
//  test
//
//  Created by big on 2019/2/15.
//  Copyright © 2019 big. All rights reserved.
//

import UIKit
//import RxDataSources
import RxSwift
import RxCocoa
import MBProgressHUD
import enum Result.Result
import Alamofire

class TableViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let bag = DisposeBag()
    
    var modelObserable = Variable<[String]> ([])

        var dataModel: MModel?
    let tableView = UITableView(frame: .zero, style: .plain)
    let tb = UITableView(frame: .zero, style: .plain)
//    let dataSource = RxTableViewSectionedReloadDataSource<LXFSection>(configureCell: { (_, tv, ip, model) in
//        let cell = tv.dequeueReusableCell(withIdentifier: "cell")!
//
//        return cell
//        })

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
//            make.edges.equalTo(self.view).inset(UIEdgeInsets.zero)
            make.size.equalTo(CGSize.init(width: 250, height: 400))
            make.top.left.equalTo(0)
        }
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.rx.setDelegate(self as UITableViewDelegate).disposed(by: DisposeBag())
//            datasource.configureCell: { (_, tv, ip, model) in
//                let cell = tv.dequeueReusableCell(withIdentifier: "cell")!
//
//                return cell
//        }
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")

        self.view.addSubview(tb)
        tb.snp.makeConstraints({ (make) in
            make.size.equalTo(CGSize.init(width: 100, height: 400))
            make.top.right.equalTo(0)
        })
        
        _ = getData().subscribe(onSuccess: {  model in
            
            
            print(model)
//
//            //            self.passwordOutlet?.text = model.results.first?.artistName
////            let m = Observable.from(optional: model)
////           m.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: DisposeBag())
////            m.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: DisposeBag())
//            self.dataModel = model
//            self.tableView.reloadData()
        }, onError: { Error in
            print(Error)
        })
//        tableView.rx.items
//        _ = TableViewModel().getDData(next: true).asObservable().bind(to: tb.rx.items(cellIdentifier: "cell1", cellType: UITableViewCell.self)) {(row , model , cell) in
//            cell.textLabel?.text = model
//        }
//        _ = TableViewModel().getData().asObservable().bind(to: tb.rx.items(cellIdentifier: "cell1", cellType: UITableViewCell.self)) {(row , model , cell) in
//            cell.textLabel?.text = model
//        }

        
        
        //        modelObserable.asObservable().bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)){ row , model , cell in
//            cell.novelIndo = model
//            }.disposed(by: bag)

//        _ = TableViewModel().getData().subscribe(onSuccess: { (data) in
//            print(data)
//        }, onError: { error in
//            print("qwer:\(error)")
//        })
        
//                let x = apiProvider.rx.request(.postData).asObservable().mapModel(LFResponseModel.self).subscribe { (data) in
//                    print(data)
//                }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.dataModel?.results.count == 0 || self.dataModel == nil) {
            return 10
        }
        return (self.dataModel?.results.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let m = dataModel?.results[indexPath.row]
        cell.textLabel?.text =  "2"//m?.trackName
        
        return cell
    }
    //设置cell的显示动画
//    func tableView(tableView: UITableView!, willDisplayCell cell: UITableViewCell!,
//                   forRowAtIndexPath indexPath: NSIndexPath!){
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            
        //设置cell的显示动画为3D缩放
        //xy方向缩放的初始值为0.1
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        //设置动画时间为0.25秒，xy方向缩放的最终值为1
        UIView.animate(withDuration: 0.25, animations: {
            cell.layer.transform=CATransform3DMakeScale(1, 1, 1)
        })
    }
    func getData() -> Single<qwModel> {
        
        return Single<qwModel>.create{ single in
            let par : Parameters = ["term": "周杰倫", "media": "music"];
            
            Alamofire.request("https://itunes.apple.com/search", method: .post, parameters: par, encoding: URLEncoding(destination: .methodDependent), headers: nil).validate().responseJSON { (response) in
                //            response.data
                //                if let json :NSDictionary = response.result.value as? NSDictionary, let model = MModel.deserialize(from: json) {
                //                    let m:MSubModel = model.results[1]
                //                    print(m.artistId)
                //                    single(.success(model))
                //
                //                }
                
                guard let model = qwModel.deserialize(from: response.result.value as? NSDictionary) else {
                    single(.error(NSError(domain: "qwer", code: 123, userInfo: nil)))
                    return
                }
                single(.success(model))
                
            }
            
            return Disposables.create {
                //                task.cancel()
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    deinit {
        print(#function)
    }
}
