//
//  LandingTableDataProvider.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 06.03.21.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit

class LandingTableDataProvider: NSObject {
    public var didSelect: Completion<LandingCellModelType>?
    private weak var tableView: UITableView?
    private var items = [LandingCellModelType]()

    init(with tableView: UITableView) {
        super.init()
        self.tableView = tableView
        config()
    }
    
    private func config() {
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.registerCell(LandingCell.self)
    }
    
    public func update(with items: [LandingCellModelType]) {
        self.items = items
        tableView?.reloadData()
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension LandingTableDataProvider: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath) as LandingCell
        let item = items[indexPath.row]
        cell.configure(viewModel: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        didSelect?(item)
    }
}
