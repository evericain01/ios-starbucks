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
        setTabBarImage(imageName: "house.fill", title: "Home")
        style()
        layout()
    }
}

extension HomeViewController {
    // MARK: - Style
    func style() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .lightGray
    }
    
    // MARK: - Layout
    func layout() {
        view.addSubview(headerView)
        
        // Constraint for top header view
        headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

// MARK: - Animating scrollView
// When scrolling
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let y = scrollView.contentOffset.y
//
//        let swipingDown = y <= 0
//        let shouldSnap = y > 30
//        let labelHeight = headerView.greeting.frame.height + 16 // label + spacer (102)
//
//        UIView.animate(withDuration: 0.3) {
//            self.headerView.greeting.alpha = swipingDown ? 1.0 : 0.0
//        }
//
//        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [], animations: {
//            self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
//            self.view.layoutIfNeeded()
//        })
//    }

