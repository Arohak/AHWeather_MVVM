//
//  DetailViewModel.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import RxSwift

protocol DetailViewModelType {
    
    var cityName: String { get }
    func viewIsReady() -> Observable<DetailModelType>
}

struct DetailViewModel: DetailViewModelType {
    var cityName: String
    
    init(cityName: String) {
        self.cityName = cityName
    }
}

extension DetailViewModel {
    
    func viewIsReady() -> Observable<DetailModelType> {
        return Observable.create { observer in
        _ = apiHelper.rx_GetCityForecast(self.cityName, days: "7")
            .subscribe(onNext: { data in
                if let error = data["error"]["message"].string {
                    UIHelper.showHUD(error)
                    return
                }
                let cityForecast = CityForecast(data: data)
                dbHelper.storeCityForecast(cityForecast)
                let object = dbHelper.getStoredCityForecast(cityForecast.name).map({$0})[0]
                let viewModel = self.createDetailModel(object)
                
                observer.onNext(viewModel)
                
                }, onError: { e in
                    UIHelper.showHUD("No Internet Connection")
                    var object: CityForecast?
                    if dbHelper.getStoredCityForecast(self.cityName).map({$0}).count > 0 {
                        object = dbHelper.getStoredCityForecast(self.cityName).map({$0})[0]
                        let viewModel = self.createDetailModel(object!)
                        
                        observer.onNext(viewModel)
                    }
                    
            })
            
            return AnonymousDisposable { }
        }
    }
    
    private func createDetailModel(cityForecast: CityForecast) -> DetailModel {
        let topView = DetailTopViewModel(city: cityForecast)
        var dayCells = [DetailDayCellModelType]()
        for day in cityForecast.forecastDays {
            dayCells.append(DetailDayCellModel(forecastDay: day))
        }
        let viewModel = DetailModel(topView: topView, dayCells: dayCells)
        
        return viewModel
    }
}
