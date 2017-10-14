//
//  LandingViewModel.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import RxSwift
import SwiftyJSON

protocol LandingViewModelType {

    func viewIsReady() -> Observable<[LandingCellModelType]>
    func cityDidSelect(cellModel: LandingCellModelType) -> Observable<DetailViewModel>
}

struct LandingViewModel: LandingViewModelType {

}

// MARK: - DidSelect -
extension LandingViewModel {
    
    func cityDidSelect(cellModel: LandingCellModelType) -> Observable<DetailViewModel> {
        return Observable.create { observer in
            let viewModel = DetailViewModel(cityName: cellModel.name)
            observer.onNext(viewModel)
            
            return AnonymousDisposable { }
        }
    }
}

// MARK: - Cities -
extension LandingViewModel {

    func viewIsReady() -> Observable<[LandingCellModelType]> {
        return Observable.create { observer in
            let cities = ["London", "Moscow", "Yerevan"]
            var count = 0
            
            for city in cities {
                _ = apiHelper.rx_GetCityWeather(city)
                    .subscribe(onNext: { data in
                        dbHelper.storeCity(City(data: data))
                        
                        count += 1
                        if count == cities.count {
                            let cities = dbHelper.getStoredCities().map({$0})
                            var cellModels = [LandingCellModelType]()
                            for city in cities {
                                let cellModel = LandingCellModel(city: city)
                                cellModels.append(cellModel)
                            }
                            
                            observer.onNext(cellModels)
                        }
                        
                        }, onError: { e in
                            UIHelper.showHUD("No Internet Connection")
                            let cities = dbHelper.getStoredCities().map({$0})
                            var cellModels = [LandingCellModelType]()
                            for city in cities {
                                let cellModel = LandingCellModel(city: city)
                                cellModels.append(cellModel)
                            }
                            
                            observer.onNext(cellModels)
                    })
            }
            
            return AnonymousDisposable { }
        }
    }
}
