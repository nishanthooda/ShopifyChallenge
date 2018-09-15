//
//  TagsController.swift
//  TagsChallenge
//
//  Created by Nishant Hooda on 2018-09-12.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import UIKit

class TagsController: UIViewController
{
    let viewModel = TagsViewModel()
    
    private lazy var tableView: UITableView = {
        let tableview = UITableView(frame: CGRect.zero, style: .plain)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.dataSource = self
        tableview.delegate = self
        tableview.backgroundColor = .clear
        tableview.estimatedRowHeight = TagsConstants.estimatedRowHeight
        return tableview
    }()
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
        
        self.tableView.register(TagsCell.self, forCellReuseIdentifier: TagsCell.identifer)
        self.navigationController?.viewControllers = [self, ProductsController(products: [])]
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.viewModel.fetchData { success in
            
            if success
            {
                DispatchQueue.main.async {
                    self.setupUI()
                }
            }
            else
            {
                self.setupNoInternetUI()
            }
        }
    }
    
    private func setupUI()
    {
        self.view.backgroundColor = .white
        self.navigationItem.titleView = NavTitleView(title: TagsConstants.title)
        
        self.view.addSubview(self.tableView)
        
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
    
    private func setupNoInternetUI()
    {
        
    }
}

extension TagsController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.viewModel.tags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TagsCell.identifer, for: indexPath) as? TagsCell else { return UITableViewCell() }
        cell.titleLabel.text = self.viewModel.tags[indexPath.row]
        
        return cell
    }
}

extension TagsController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        guard let products = self.viewModel.productsForTag[self.viewModel.tags[indexPath.row]] else { return }
        let productsVC = ProductsController(products: products)
        
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(productsVC, animated: true)
        }
    }
}



