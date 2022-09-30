//
//  StarBucksViewController.swift
//  Starbucks
//
//  Created by Ebrahim Vericain on 2022-09-29.
//

import UIKit

// MARK: - Initial StarBucks View Controller (responsible for setting the tab bar)
class StarBucksViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    // A required function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        
    }
    
    // Sets the image and title of an item on the tab bar
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
    
}

// MARK: - ScanViewController
class ScanViewController: StarBucksViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemIndigo
        title = "Scan"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "qrcode", title: "Scan")
    }
}

// MARK: - OrderViewController
class OrderViewController: StarBucksViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
        title = "Order"
    }

    override func commonInit() {
        setTabBarImage(imageName: "arrow.up.bin.fill", title: "Order")
    }
}

// MARK: - GiftViewController
class GiftViewController: StarBucksViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemGreen
        title = "Gift"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "gift.fill", title: "Gift")
    }
}

// MARK: - StoreViewController
class StoreViewController: StarBucksViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemTeal
        title = "Stores"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "location.fill", title: "Stores")
    }

}

