//
//  NetworkManager.swift
//  RateCalculator
//
//  Created by Bowie Tso on 25/1/2022.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

enum FailReason: Error {
    case network
    case realmWrite
    case cert
    case nullData
    case other
}

class NetworkManager {
    static let hsbcRateRequestBasePath = "https://rbwm-api.hsbc.com.hk/pws-hk-hase-rates-papi-prod-proxy/v1"
    static let hkmaRequestBasePath = "https://api.hkma.gov.hk/public/market-data-and-statistics/"

    static let imageLink = "http://openweathermap.org/img/wn/"

    //hsbc end point
    static let currentRate = "/fxtt-exchange-rates"

    static var requestPool = Set<String>()

  
  // MARK: - Common

    static let manager: Session = {
      //2
        let configuration = URLSessionConfiguration.af.default
      //here do api cert pinning if need
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        configuration.urlCache = nil
        configuration.httpAdditionalHeaders = Alamofire.HTTPHeaders.default.dictionary
        return Session(configuration: configuration)
    }()
    
    static func getHeader(addToken: Bool = false) -> HTTPHeaders {
        
        
        var param: [String: String] = [
            "Content-Type": "application/json",
            "Cache-Control": "no-cache"
        ]
        return HTTPHeaders.init(param)
    }
//    func stopAllRunningRequest() {
//        sessionManager.tasks { (tasks) in
//        tasks.forEach({ $0.cancel() })
//      }
//    }
    
    static func isReachable() -> Bool {
        return ReachabilityHelper.shared.manager?.isReachable ?? false
    }
    
    private func showLoadingIndicator(_ enable: Bool, requestId: String) {
        if enable {
            NetworkManager.requestPool.insert(requestId)
            let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .compactMap({$0 as? UIWindowScene})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
            if let rootViewController = keyWindow?.rootViewController as? BaseViewController{
                rootViewController.startLoading()
            }
        }
    }
    
    private func hideLoadingIndicator(requestId: String) {
        NetworkManager.requestPool.remove(requestId)
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        if NetworkManager.requestPool.count == 0 {
            if let rootViewController = keyWindow?.rootViewController as? BaseViewController{
                rootViewController.stopLoading()
            }
        }
    }
    
    func request<T: Codable>(_ url: URL,
                                         type: T.Type,
                                         customHeader: HTTPHeaders? = nil,
                                         method: HTTPMethod = .post,
                                         param: Codable? = nil,
//                                         errorType: E.Type,
                                         enableLoadingIndicator: Bool = true) -> Observable<T> {
        return Observable.create { [weak self] observer  -> Disposable in
        
            let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .compactMap({$0 as? UIWindowScene})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
            let headers = NetworkManager.getHeader()
            let param = try? param?.asDictionary()
            let uuid = UUID().uuidString
            
            self?.showLoadingIndicator(true, requestId: uuid)
            let encoding: Alamofire.ParameterEncoding = method != .get ? JSONEncoding.default : URLEncoding.default
            
            NetworkManager.manager
                .request(url, method: method, parameters: param, encoding: encoding, headers: headers)
                .validate(contentType: ["application/json"])
                .validate(statusCode: 200..<300)
                .response(completionHandler: { dataResponse in
                    
                    if enableLoadingIndicator {
                        self?.hideLoadingIndicator(requestId: uuid)
                    }
                    switch dataResponse.result{
                        case .success(let data):
                            let jsonDecoder = JSONDecoder()
                            guard let response = data else{
                                if let rootViewController = keyWindow?.rootViewController as? BaseViewController{
                                    rootViewController.stopLoading()
                                    rootViewController.showAlert("Null Data", okClicked: {_ in
                                        return
                                    })
                                }
                                return
                            }
                            var data: T?
                            do {
                                data = try jsonDecoder.decode(T.self, from: response)
                                
                                if let data = data {
                                    observer.onNext(data)
                                    observer.onCompleted()
                                } else {
                                    if let rootViewController = keyWindow?.rootViewController as? BaseViewController{
                                        rootViewController.stopLoading()
                                        rootViewController.showAlert("Null Data", okClicked: {_ in
                                            return
                                        })
                                    }
                                }
                            } catch {
                                print(error.localizedDescription)
                            }
                        case .failure(let error):
                            print(error.localizedDescription)
                        if let rootViewController = keyWindow?.rootViewController as? BaseViewController{
                            rootViewController.stopLoading()
                            if dataResponse.error?.isServerTrustEvaluationError ?? false{
                                rootViewController.showAlert(error: .cert, okClicked: nil)
                            }else if !Self.isReachable(){
                                rootViewController.showAlert(error: .network, okClicked: nil)
                            }
                        }
                            
                    }
                })
            return Disposables.create()
        }
    }
    
}
