//
//  DetailModel.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

protocol DetailModelType {
    var topView: DetailTopViewModelType { get }
    var dayCells: [DetailDayCellModelType] { get }
}

struct DetailModel: DetailModelType {
    var topView: DetailTopViewModelType
    var dayCells: [DetailDayCellModelType]
}
