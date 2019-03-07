//
//  ViewController.swift
//  test
//
//  Created by big on 2019/2/12.
//  Copyright © 2019 big. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import SDAutoLayout
import ReactiveSwift
import RxCocoa
import RxSwift
import SnapKit
import GoogleMobileAds
import AudioToolbox

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    var passwordOutlet: UITextField?
    
    @objc dynamic var message = "hangge.com"

    var tabView: UITableView?
    
    var dataModel: MModel?
    var disposeBag = DisposeBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let v = ((Bool, String?) -> Int).self
        let x = {(x: Int) ->  Int in
            return x/2
        }
        
         print(x(4))
        
//        let n = NSDecimalNumber(string: "11")
//        let num = n.raising(toPower: 111)
//        print(num)
//        let bun = Bundle.main.n
        
//        let bannerView = GADBannerView(adSize: kGADAdSizeBanner, origin: CGPoint.init(x: 50, y: 500))
//        self.view.addSubview(bannerView)
//        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"//"ca-app-pub-3606599579948541/4674057005"
//
//        bannerView.rootViewController = self
//        bannerView.load(GADRequest())

//        let vieww = UIView(frame: .init(x: 40, y: 40, width: 150, height: 150))
//                self.view.addSubview(vieww)
//        UIView.animate(withDuration: 6, animations: {
//            vieww.alpha = 0
//        }) { (_) in
//            vieww.removeFromSuperview()
//        }
//        vieww.backgroundColor = .red
//

//
//        let img = UIImageView(frame: .init(x: 40, y: 40, width: 150, height: 150))
////        img.backgroundColor = .red
//
//        img.sd_setImage(with: URL(string: "https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike60%2C5%2C5%2C60%2C20/sign=7f0e95dfa918972bb737089887a410ec/8644ebf81a4c510f76e14bd16259252dd52aa5d0.jpg"), completed: nil)
//        self.view.addSubview(img)

//        img.snp.makeConstraints { (make) in
//            make.left.equalTo(self.view).offset(20)
//        }
//        Disposables
//        let newData = Single<MSubModel>.create { si in
//            let dict = ["asdf":"2", "qwer": nil] as [String: Any?]
//            let model = MSubModel.deserialize(from: dict as [String : Any])
//            print(model?.asdf,model?.qwer)
//
////            let b = MSubModel.toJSON(<#T##MSubModel#>)
////            passwordOutlet?.rx.text.bind()
//            si(.success(model!))
//            return Disposables.create()
//        }
        
//        let intSequence = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
//            .replay(5)
//
//        _ = intSequence
//            .subscribe(onNext: { print("Subscription 1:, Event: \($0)") })
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            _ = intSequence.connect()
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
//            _ = intSequence
//                .subscribe(onNext: { print("Subscription 2:, Event: \($0)") })
//        }
        
        
        passwordOutlet = UITextField(frame: .init(x: 50, y: 200, width: 200, height: 60))
        passwordOutlet?.backgroundColor = .red
        self.view.addSubview(passwordOutlet!)
//        newData.subscribe(onSuccess: { (model) in
////            print(model)
//            self.passwordOutlet?.text = model.asdf
//        }, onError: {error in
//
//        })
        
        
//        Alamofire.request("https://httpbin.org/get").responseJSON { response in
//            print(response.request)  // original URL request
//            print(response.response) // HTTP URL response
//            print(response.data)     // server data
//            print(response.result)   // result of response serialization
//
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
//        }
        
//        let pv = passwordOutlet.rx.text.orEmpty.map{$0.count > 3}.share(replay: 1)
//        let everythingValid = Observable.combineLatest(
//            pv,
//            pv
//        ) { $0 && $1 } // 取用户名和密码同时有效
//            .share(replay: 1)
//
        let btn = UIButton(type: .system)
        btn.frame = .init(x: 50, y: 430, width: 100, height: 50)
        self.view.addSubview(btn)
        btn.backgroundColor = .red
//        btn.rx.tap.asDriver().drive({ _ in
//            print("wwww")
//        })
//        btn.rx.tap
//            .subscribe(onNext: {  _ in
//            print("wqe")
//            })
//            .disposed(by: DisposeBag())
        btn.rx.tap.asObservable()
            .subscribe({ (_) in
                print("button Tapped")
            }).disposed(by: disposeBag)
//        btn.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)

        
//        let image :Observable<UIImage>
//        image.bind(to: img.rx.image)
        
        
//        getData().subscribe(onSuccess: { model in
//            print(model)
////            self.passwordOutlet?.text = model.results.first?.artistName
//            let _ = Observable.from(optional: model)
//
//            self.dataModel = model
//            self.tabView?.reloadData()
//        }, onError: { Error in
//            print(Error)
//        })
        
//        let x = Observable<Int>.interval(1.5, scheduler: SerialDispatchQueueScheduler.init(internalSerialQueueName: "q1")).publish()
//
//        _ = x.subscribe({
//            print("\($0)")
//        })
//
//        _ = x.connect()
        
//        Observable.of(1,2,3,4).reduce(1, accumulator:+).subscribe({
//            print($0)
//        }).disposed(by: DisposeBag())
//        _ = Observable.repeatElement(0).subscribe({
//            print($0)
//        })
        
        
//        self.dataModel
        
//        getRepo("").subscribe(onSuccess: { json in
//            print(json)
//        }, onError: {error in
//            print(error)
//        })
//        let numbers: Observable<Int> = Observable.create { observer in
//            print("1234qwrr")
//            observer.onNext(1)
//            observer.onNext(2)
////            observer.onCompleted()
//            observer.onError(NSError(domain: "1", code: 123, userInfo: nil))
//
//            return Disposables.create()
//        }.retry(2)
//
//        numbers.subscribe(onNext: {json in
//
//        }, onError: { error in
//
//        }, onCompleted: {
//
//        }).disposed(by: DisposeBag())
        
        
//        Observable<Int>.interval(1, scheduler: MainScheduler.instance).subscribe(onNext: { [unowned self] _ in
//            self.message.append("!")
//
//        }).disposed(by: DisposeBag())
//
//        _ = self.rx.observe(String.self, "message").subscribe ({ (value) in
//            print(value )
//        })
//        //定时器（1秒执行一次）
//        Observable<Int>.interval(1, scheduler: MainScheduler.instance)
//            .subscribe(onNext: { [unowned self] _ in
//                //每次给字符串尾部添加一个感叹号
//                self.message.append("!")
//            }).disposed(by: DisposeBag())
//
//        //监听message变量的变化
//        _ = self.rx.observeWeakly(String.self, "message")
//            .subscribe(onNext: { (value) in
//                print(value ?? "")
//            })
        
//        Observable.of(4, 2, 3, 6, 3, 2, 1)
//            .skipWhile { $0 < 4 }
//            .subscribe(onNext: { print($0) })
//            .disposed(by: DisposeBag())
//
//        let disposeBag = DisposeBag()
//        let first = PublishSubject<String>()
//        let second = PublishSubject<String>()
//
//        Observable.zip(first, second) { $0 + $1 }
//            .subscribe(onNext: { print($0) })
//            .disposed(by: disposeBag)
//
//        first.onNext("1")
//        second.onNext("A")
//        first.onNext("2")
//        second.onNext("B")
//        second.onNext("C")
//        second.onNext("D")
//        first.onNext("3")
//        first.onNext("4")
        
        //监听视图frame的变化
//        _ = self.rx.observe(CGRect.self, "view.frame")
//            .subscribe(onNext: { frame in
//                print("--- 视图尺寸发生变化 ---")
//                print(frame!)
//                print("\n")
//            })
        //定时器（1秒执行一次）
//        Observable<Int>.interval(1, scheduler: MainScheduler.instance)
//            .subscribe(onNext: { [unowned self] _ in
//                //每次给字符串尾部添加一个感叹号
//                self.message.append("!")
//            }).disposed(by: DisposeBag())
//        _ = Timer(timeInterval: 0.5, repeats: true, block: { (_) in
//            self.message.append("!")
//        })
        
        //监听message变量的变化
        _ = self.rx.observeWeakly(String.self, "message")
            .subscribe(onNext: { (value) in
                print(value ?? "")
            })
        
//        _ = NotificationCenter.default.rx.notification(Notification.Name(rawValue: "DownloadImageNotification")).takeUntil(self.rx.deallocated).subscribe(onNext: { noti in
//            let userinfo = noti.userInfo! as NSDictionary
//            let v1 = userinfo["value1"]
//            let v2 = userinfo["value2"]
//            print("\(v1),\(v2)")
//
//
//        })
//÷        let tap = UITapGestureRecognizer()

//        btn.rx.subscribe( { [weak self] in
//            self?.showAlert()
//            }, onError: { error in
//                print("发生错误： \(error.localizedDescription)")
//        }, onCompleted: {
//            print("任务完成")
//        })
//        AnyObserver
        
    }
    
    func changeValues<T>(_ a:inout T, _ b:inout T)  {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    @objc func buttonTapped() {
        print("button Tapped")
    }
    override func viewDidAppear(_ animated: Bool) {
        let notificationName = Notification.Name(rawValue: "DownloadImageNotification")
        NotificationCenter.default.post(name: notificationName, object: self, userInfo: ["value1":"hangge.com", "value2" : 12345])

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.pushViewController(TableViewViewController(), animated: true)
        
//        AudioServicesPlaySystemSound(1521)
//        let s = UIImpactFeedbackGenerator(style: .medium)
//        s.impactOccurred()

        
//        self.message.append("!")
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let x = storyboard.instantiateViewController(withIdentifier: "ImageSelViewController")
//        print(x)
    }
    
    
//    func cacheLocally() -> Completable {
//        return Completable.create { completable in
//            // Store some data locally
//
//            guard success else {
//                completable(.error(NSError(domain: "qwer", code: 123, userInfo: nil)))
//                return Disposables.create {}
//            }
//
//            completable(.completed)
//            return Disposables.create {}
//        }
//    }
    
    func ss () {
        let alertView = UIAlertView(
            title: "RxExample",
            message: "This is wonderful",
            delegate: nil,
            cancelButtonTitle: "OK"
        )
        
        alertView.show()
    }
//    func POST(url: String, par: Parameters) {
//        let par : Parameters = ["term": "周杰倫", "media": "music"];
//
//        Alamofire.request("https://itunes.apple.com/search", method: .post, parameters: par, encoding: URLEncoding(destination: .methodDependent), headers: nil).validate().responseJSON { (response) in
//            //            response.data
//            if let json :NSDictionary = response.result.value as? NSDictionary, let model = MModel.deserialize(from: json) {
//                let m:MSubModel = model.results[1]
//                print(m.artistId)
//
//            }
//        }
//    }
//    typealias MM = Any
//    let jsons: Observable<MM> = Observable.create { (observer) -> Disposable in
//
//        let par : Parameters = ["term": "周杰倫", "media": "music"];
//
//        let task = Alamofire.request("https://itunes.apple.com/search", method: .post, parameters: par, encoding: URLEncoding(destination: .methodDependent), headers: nil).validate().responseJSON { (response) in
//            //            response.data
//            if let json :NSDictionary = response.result.value as? NSDictionary, let model = MModel.deserialize(from: json) {
//                let m:MSubModel = model.results[1]
//                print(m.artistId)
//
//            }
//        }
//        return Disposables.create(task.cancel())
//    }
    
    func getData() -> Single<MModel> {
        
        return Single<MModel>.create{ single in
            let par : Parameters = ["term": "周杰倫", "media": "music"];
            
            Alamofire.request("https://itunes.apple.com/search", method: .post, parameters: par, encoding: URLEncoding(destination: .methodDependent), headers: nil).validate().responseJSON { (response) in
                //            response.data
//                if let json :NSDictionary = response.result.value as? NSDictionary, let model = MModel.deserialize(from: json) {
//                    let m:MSubModel = model.results[1]
//                    print(m.artistId)
//                    single(.success(model))
//
//                }
                
                guard let model = MModel.deserialize(from: response.result.value as? NSDictionary) else {
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
    
    func getRepo(_ repo: String) -> Single<[String: Any]> {
        
        return Single<[String: Any]>.create { single in
            let url = URL(string: "https://api.github.com/repos/\(repo)")!
            let task = URLSession.shared.dataTask(with: url) {
                data, _, error in
                
                if let error = error {
                    single(.error(error))
                    return
                }
                
                guard let data = data,
                    let json = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves),
                    let result = json as? [String: Any] else {
                        single(.error(NSError(domain: "qwer", code: 123, userInfo: nil)))
                        return
                }

                single(.success(result))
            }
            
            task.resume()
            
            return Disposables.create { task.cancel() }
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.cellHeight(for: indexPath, cellContentViewWidth: UIScreen.main.bounds.width, tableView: tableView)
    }
}


