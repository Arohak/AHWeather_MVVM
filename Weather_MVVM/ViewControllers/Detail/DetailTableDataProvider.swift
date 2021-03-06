//
//  DetailTableDataProvider.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 06.03.21.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit

class DetailTableDataProvider: NSObject {
    private weak var tableView: UITableView?
    private var items = [DetailDayCellModelType]()

    init(with tableView: UITableView) {
        super.init()
        self.tableView = tableView
        config()
    }
    
    private func config() {
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.registerCell(DetailDayCell.self)
    }
    
    public func update(with items: [DetailDayCellModelType]) {
        self.items = items
        tableView?.reloadData()
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension DetailTableDataProvider: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath) as DetailDayCell
        let item = items[indexPath.row]
        cell.configure(viewModel: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
