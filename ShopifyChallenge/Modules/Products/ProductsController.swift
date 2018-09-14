//
//  ProductsController.swift
//  ShopifyChallenge
//
//  Created by Nishant Hooda on 2018-09-12.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation
import UIKit

class ProductsController: UIViewController
{
    var viewModel: ProductsViewModel
    
    private lazy var tableView: UITableView = {
        let tableview = UITableView(frame: CGRect.zero, style: .plain)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.dataSource = self
        tableview.delegate = self
        tableview.backgroundColor = .clear
        tableview.estimatedRowHeight = ProductsConstant.estimatedCellHeight
        
        return tableview
    }()
    
    init(products: [Product])
    {
        self.viewModel = ProductsViewModel(products: products)
        
        super.init(nibName: nil, bundle: nil)
        
        self.tableView.register(ProductsCell.self, forCellReuseIdentifier: ProductsCell.identifer)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    private func setupUI()
    {
        self.view.backgroundColor = .white
        self.title = "Products"
        
        self.view.addSubview(self.tableView)
        
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
}

extension ProductsController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let product = self.viewModel.products[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductsCell.identifer, for: indexPath) as? ProductsCell else { return UITableViewCell() }
        cell.titleLabel.text = product.title
        cell.codeLabel.text = product.variants.first?.price
        
        return cell
    }
}

extension ProductsController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
}
