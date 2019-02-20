//
//  TableViewModel.swift
//  test
//
//  Created by big on 2019/2/15.
//  Copyright © 2019 big. All rights reserved.
//

import UIKit
import Moya
import Alamofire
import RxSwift
import RxCocoa

class TableViewModel: NSObject {
    
    var modelObserable : Variable<[String]>?
    
    //搜索资源数据
    func searchRepositories(query:String) -> Observable<GitModel> {
        return apiProvider.rx.request(.getGitHub(query))
            .asObservable()
            .mapModel(GitModel.self)
            .asObservable()
            .catchError({ error in
                print("发生错误：",error.localizedDescription)
                return Observable<GitModel>.empty()
            })
    }
    
    func getDData(next: Bool) -> Observable<[String]> {
        
        
        return Observable<[String]>.create({ob in
            _ = apiProvider.rx.request(.postData).asObservable().mapModel(LFResponseModel.self).subscribe(onNext: { [weak self] qw in
//                if next {
//                    self?.modelObserable?.value += qw.arr
//                }else {
//                    self?.modelObserable?.value = qw.arr
//                }
                ob.onNext(qw.arr)
                ob.onCompleted()
            })
            return Disposables.create {}
        })
            
//        })
//        self?.modelObserable?.value
        
//        return x
        
//        asDriver(onErrorDriveWith: Driver.empty())
//        print(x)
//        x.asObservable().subscribe({x in
//            print(x)
//        })
    }
    
//    func getData() -> Observable<[qwResultsModel]> {
//        
//        let par : Parameters = ["term": "周杰倫", "media": "music"]
//        
////        return Observable<[qwResultsModel]>.create({ ob in
//        _ = apiProvider.rx.request(.getList(par)).asObservable().mapModel(qwModel.self).subscribe(onNext: { (m) in
//            return m.results
//        }, onError: nil, onCompleted: nil, onDisposed: nil)
////            _ = apiProvider.rx.request(.getList(par)).asObservable().mapModel(qwModel.self)
////                .map({xc in
////                   let x = xc.results
////            ob.onNext(x)
////            ob.onCompleted()
////        return x
//        
////                .subscribe(onNext: {model in
////                single(.success(model))
////            })
////            return Disposables.create {}
////        })
//        
////        return Single<LFResponseModel>.create(subscribe: { single in
////            _ = apiProvider.rx.request(.postData).mapJSON().subscribe(onSuccess: { (data) in
////                let m = LFResponseModel.deserialize(from: data as? NSDictionary)
//////                self.modelObserable!.value = m!
////                single(.success(m!))
////            }, onError: {error in
////                single(.error(error))
////            })
////            return Disposables.create {}
////        })
//        
//        
//        
////        return Single<LFResponseModel>.create(subscribe: { single in
////            _ = provider.rx.request(.postData).mapJSON().subscribe(onSuccess: { (data) in
////                let m = LFResponseModel.deserialize(from: data as? NSDictionary)
////                single(.success(m!))
////            }, onError: {error in
////                single(.error(error))
////            })
////            return Disposables.create {}
////        })
//        
//        
//        //        return provider.rx.request(.getList(par)).mapJSON()
////
////        apiProvider.request(.getList(par)) { (result) in
//////            print(response.value?.data)
////
////            switch result {
////            case let .success(moyaResponse):
////
////                let data = moyaResponse.data // 获取到的数据
////                let statusCode = moyaResponse.statusCode // 请求状态： 200, 401, 500, etc
////                let dic = try? moyaResponse.mapJSON() as! NSDictionary
//////                print(dic)
//////                let m = MModel.deserialize(from: dic)
//////print(m)
////            case let .failure(error):
////                print(error.localizedDescription)
////            }
////        }
////
////        provider.request(.postData) { (result) in
////
////            switch result {
////            case let .success(moyaResponse):
////                print(try? moyaResponse.mapJSON())
////
////            case .failure(_): break
////
////            }
////        }
//        
//        
//    }
    
//    func requestDataWithTargetJSON<T:TargetType>(target:T,successClosure:@escaping SuccessJSONClosure,failClosure: @escaping FailClosure) {
//        let requestProvider = MoyaProvider<T>(requestClosure:requestTimeoutClosure(target: target))
//        let _=requestProvider.request(target) { (result) -> () in
//            switch result{
//            case let .success(response):
//                do {
//                    let mapjson = try response.mapJSON()
//                    let json=JSON(mapjson)
//                    successClosure(json)
//                } catch {
//                    failClosure(self.failInfo)
//                }
//            case let .failure(error):
//                failClosure(error.errorDescription)
//            }
//        }
//    }
}
