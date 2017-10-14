//
//  APIHelper.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import RxSwift
import SwiftyJSON
import Alamofire

let apiHelper = APIHelper.sharedInstance

let baseURLOne = "http://api.openweathermap.org/data/2.5/"
let baseURLTwo = "http://api.apixu.com/v1/"
let APPIDOne   = "848c6f714deb2219816b686306bc766d"
let APPIDTwo   = "6c0d9ec402854c01a6c120751160203"

class APIHelper {
    
    static let sharedInstance = APIHelper()
    let manager = Manager()
    
    //MARK: - API Routers
    private struct ROUTERS {
        static let GET_CITY_WEATHER             = "weather?APPID=%@&q=%@&units=metric"
        static let GET_CITY_FORECAST            = "forecast.json?key=%@&q=%@&days=%@"
//
//        static let GET_CITY_WEATHER         = "current.json?key=%@&q=%@"
//        static let GET_CITY_FORECAST        = "forecast/daily?q=%@&mode=json&units=metric&cnt=%@&APPID="
    }
    
    func rx_Request(method: Alamofire.Method,
                 url: String,
                 parameters: [String: AnyObject]? = nil,
                 showProgress: Bool = true)
                -> Observable<JSON>
    {
        return Observable.create { observer in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            if showProgress { UIHelper.showProgressHUD() }
            
            let URL = url.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())!
            self.manager.request(method, URL, parameters: parameters, encoding: .URL)
                .responseJSON { response in
                    switch response.result {
                    case .Success(let data):
                        observer.onNext(JSON(data))
                    case .Failure(let error):
                        UIHelper.showHUD(error.localizedDescription)
                        observer.onError(error)
                    }
                    
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                    if showProgress { UIHelper.hideProgressHUD() }
            }
            
            return AnonymousDisposable { }
        }
    }
    
    func rx_GetCityWeather(cityName: String) -> Observable<JSON> {
        let url = String(format: baseURLOne + ROUTERS.GET_CITY_WEATHER, APPIDOne, cityName)
        return rx_Request(.GET, url: url)
    }
    
    func rx_GetCityForecast(cityName: String, days: String) -> Observable<JSON> {
        let url = String(format: baseURLTwo + ROUTERS.GET_CITY_FORECAST, APPIDTwo, cityName, days)
        return rx_Request(.GET, url: url)
    }
}
