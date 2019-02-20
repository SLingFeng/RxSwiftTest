//
//  ApiManager.swift
//
//
//  Created by big on 2019/2/15.
//  Copyright © 2019 big. All rights reserved.
//

import Foundation
import Moya

import RxSwift
import RxCocoa
import enum Result.Result
import Alamofire

let apiProvider = MoyaProvider<Api>(plugins: [RequestLoadingPlugin()])

enum Api {
    case getList(Parameters)
    case postData
    case getGitHub(String)
}

extension Api: TargetType {
    var baseURL: URL {
        switch self {
        case .getList:
            return URL(string: "https://itunes.apple.com/")!
        case .postData:
            return URL(string: "https://httpbin.org/")!
        case .getGitHub(_):
            return URL(string: "https://api.github.com")!
        }
    }
    
    var path: String {
        switch self {
        case .getList:
            return "search"
        case .postData:
            return "post"
        case .getGitHub(_):
            return "/search/repositories"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getList:
            return .post
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case let .getList(par):
            return .requestParameters(parameters: par, encoding: URLEncoding.queryString)
        case .getGitHub(let query):
            let params = ["q":query, "sort" : "stars", "order" : "desc"] as [String : Any]
//            params["q"] = query
//            params["sort"] = "stars"
//            params["order"] = "desc"
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
//        return nil
    }
}

public final class RequestLoadingPlugin:PluginType{
    
    public func willSend(_ request: RequestType, target: TargetType) {
        SLFHUD.showLoading()
    }
    
    public func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        SLFHUD.hide()
    }
}

