//
//  HomeViewController.swift
//  Starbucks
//
//  Created by Ebrahim Vericain on 2022-09-29.
//

import UIKit

class HomeViewController: StarBucksViewController {

    let headerView = HomeHeaderView()
    var headerViewTopConstraint: NSLayoutConstraint?
    var tableView = UITableView()
    
    let cellId = "cellId"
    let tiles = [
                "Star balance",
                "Bonus stars",
                "Try these",
                "Welcome back",
                "Uplifting"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupNavBar()
        setTabBarImage(imageName: "house.fill", title: "Home")
        setupTableView()
        style()
        layout()
    }
    
    // MARK: - Navigation Bar
//    func setupNavBar() {
//
//        // Use "bar appearance" to customize nav bar
//        let barAppearance = UINavigationBarAppearance()
//        barAppearance.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.2)
//
//        navigationItem.standardAppearance = barAppearance
//        navigationItem.scrollEdgeAppearance = barAppearance
//
//        navigationController?.navigationBar.topItem?.title = "Good afternoon! ☀️"
//    }

}

extension HomeViewController {
    // MARK: - Style
    func style() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .systemPink
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Layout
    func layout() {
        view.addSubview(headerView)
        view.addSubview(tableView)
        
        // Constraint for top header view
        headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - TableView
extension HomeViewController: UITableViewDataSource {
    
    // Setting up the table view
    func setupTableView() {
        
        // Set the HomeViewController as the datasource and delegate of the tableview
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
    
    // Customizing that specific cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = tiles[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
    
    // Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tiles.count
    }
    

}

// MARK: - Animating scrollView
extension HomeViewController: UITableViewDelegate {
    
    // Giving a nice thick height for each row in the table view
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    // When scrolling
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
     
        let swipingDown = y <= 0
        let shouldSnap = y > 30
        let labelHeight = headerView.greeting.frame.height + 16 // label + spacer (102)
        
        UIView.animate(withDuration: 0.3) {
            self.headerView.greeting.alpha = swipingDown ? 1.0 : 0.0
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [], animations: {
            self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
            self.view.layoutIfNeeded()
        })
    }
}
