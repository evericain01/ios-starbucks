//
//  HomeViewController.swift
//  Starbucks
//
//  Created by Ebrahim Vericain on 2022-09-29.
//

import UIKit

class HomeViewController: StarBucksViewController {

    let headerView = HomeHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupNavBar()
        setTabBarImage(imageName: "house.fill", title: "Home")
        
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
    }
    
    // MARK: - Layout
    func layout() {
        view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
