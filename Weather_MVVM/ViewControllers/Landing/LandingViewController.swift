//
//  LandingViewController.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import UIKit
import RxSwift

final class LandingViewController: BaseViewController {
    
    // MARK: - Properties -
    var landingView = LandingView()
    
    private var viewModel: LandingViewModelType!
    private let cellIdentifire = "cellIdentifire"
    private var cities = [LandingCellModelType]()
    
    // MARK: - Initializing -
    init(viewModel: LandingViewModelType) {
        super.init()
        
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configure(viewModel)
    }
    
    // MARK: - Configuring -
    private func configureView() {
        self.view = landingView
        
        title = "Landing"
        
        landingView.tableView.dataSource = self
        landingView.tableView.delegate = self
        landingView.tableView.registerClass(LandingCell.self, forCellReuseIdentifier: cellIdentifire)
    }
    
    private func configure(viewModel: LandingViewModelType) {
        _ = viewModel.viewIsReady()
            .subscribeNext({ cities in
                self.cities = cities
                
                self.landingView.tableView.reloadData()
            })
    }
}

//MARK: - extension for UITableView -
extension LandingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifire) as! LandingCell
        let city = cities[indexPath.row]
        cell.configure(city)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let city = cities[indexPath.row]
        
        _ = viewModel.cityDidSelect(city)
            .subscribeNext { viewModel in
                let viewController = DetailViewController(viewModel: viewModel)
                Wireframe.pushViewController(viewController)
        }
    }
}
