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
        tableview.estimatedSectionHeaderHeight = ProductsConstant.estimatedCellHeight
        return tableview
    }()
    
    init(products: [Product])
    {
        self.viewModel = ProductsViewModel(products: products)
        
        super.init(nibName: nil, bundle: nil)
        
        self.tableView.register(VariantCell.self, forCellReuseIdentifier: VariantCell.identifer)
        self.tableView.register(ProductHeaderCell.self, forHeaderFooterViewReuseIdentifier: ProductHeaderCell.identifer)
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
        self.navigationItem.titleView = NavTitleView(title: ProductsConstant.title)
        
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
        return self.viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.viewModel.products[section].variants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let variant = self.viewModel.products[indexPath.section].variants[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VariantCell.identifer, for: indexPath) as? VariantCell else { return UITableViewCell() }
        cell.titleLabel.text = variant.title
        cell.priceLabel.text = ProductsConstant.dollarSign + variant.price
        cell.inventoryLabel.text = ProductsConstant.inventory + String(variant.inventory)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let product = self.viewModel.products[section]
        
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProductHeaderCell.identifer) as? ProductHeaderCell else { return UITableViewHeaderFooterView() }
        
        header.titleLabel.text = product.title
        header.productImage.loadImage(withURL: product.imageURL)
        
        return header
    }
}

extension ProductsController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
}
