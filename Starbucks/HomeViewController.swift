//
//  HomeViewController.swift
//  Starbucks
//
//  Created by Ebrahim Vericain on 2022-09-29.
//

import UIKit

class HomeViewController: StarBucksViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setTabBarImage(imageName: "house.fill", title: "Home")
    }
    
    func setupNavBar() {
        
        // Use "bar appearance" to customize nav bar
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.2)

        navigationItem.standardAppearance = barAppearance
        navigationItem.scrollEdgeAppearance = barAppearance
        
        navigationController?.navigationBar.topItem?.title = "Good afternoon! ☀️"
    }

}
