//
//  HomeViewController.swift
//  Starbucks
//
//  Created by Ebrahim Vericain on 2022-09-29.
//

import UIKit

class HomeViewController: StarBucksViewController {

    let topSpacerView = UIView()
    let headerView = HomeHeaderView()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let scanButton = UIButton()
    
    var headerViewTopConstraint: NSLayoutConstraint?
    
    // Setting the spacing for the "Scan button"
    struct ScanButtonSpacing {
        static let height: CGFloat = 60
        static let width: CGFloat = 170
    }
    
    let tiles = [
        RewardsTileViewController(),
        TileViewController(title: "Breakfast made meatless", subtitle: "Try the Beyond Meat, Cheddar & Egg Breakfast Sandwich. Vegetarian and protein-packed.", imageName: "meatless"),
        TileViewController(title: "Uplifting out communities", subtitle: "Thanks to our partners' nominations, The Starbucks Foundation is donating $145k to more than 50 local charities.", imageName: "communities"),
        TileViewController(title: "Spend at least $15 for 50 Bonus Stars", subtitle: "Collect 50 Bonus Stars when you spend at least $15 pre-tax", imageName: "bonus"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setTabBarImage(imageName: "house.fill", title: "Home")
        style()
        layout()
    }
    
    func setupScrollView() {
        scrollView.delegate = self
    }
}

extension HomeViewController {
    // MARK: - Style
    func style() {
        view.backgroundColor = .backgroundWhite
        topSpacerView.backgroundColor = .white
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        topSpacerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Sets the stack view vertically
        stackView.axis = .vertical
        stackView.spacing = 8
        
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        scanButton.setTitle("Scan in store", for: .normal)
        scanButton.titleLabel?.minimumScaleFactor = 0.5
        scanButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        scanButton.titleLabel?.adjustsFontSizeToFitWidth = true
        scanButton.backgroundColor = .lightGreen
        scanButton.setTitleColor(.white, for: .normal)
        scanButton.layer.cornerRadius = ScanButtonSpacing.height / 2
    }
    
    // MARK: - Layout
    func layout() {
        view.addSubview(topSpacerView)
        view.addSubview(headerView)
        view.addSubview(scrollView)
        view.addSubview(scanButton)
        
        // Adding stack view into the scroll view
        scrollView.addSubview(stackView)
        
        // Adding each tile into the stack view iteratively
        for tile in tiles {
            addChild(tile)
            stackView.addArrangedSubview(tile.view)
            tile.didMove(toParent: self)
        }
        
        // Constraint for top header view
        headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            topSpacerView.topAnchor.constraint(equalTo: view.topAnchor),
            topSpacerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topSpacerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topSpacerView.heightAnchor.constraint(equalToConstant: 100),
            
            
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // Setting the stack view to have the same dimensions of the scroll view
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            // Setting the stack view width to be the same as the scroll view width
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            scanButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            scanButton.widthAnchor.constraint(equalToConstant: ScanButtonSpacing.width),
            scanButton.heightAnchor.constraint(equalToConstant: ScanButtonSpacing.height),
            
        ])
    }
}

// MARK: - Animating scrollView
// When scrolling
extension HomeViewController: UIScrollViewDelegate {
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

