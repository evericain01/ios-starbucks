//
//  TileViewController.swift
//  Starbucks
//
//  Created by Ebrahim Vericain on 2022-10-02.
//

import UIKit

// Using the this TileViewController class to set the auto layout dimensions
class TileViewController: UIViewController {
    
    let tileView = TileView()
    
    // A constructor that can be used to set the contents of the a Tile
    init(title: String, subtitle: String, imageName: String) {
        super.init(nibName: nil, bundle: nil)
        
        tileView.titleLabel.text = title
        tileView.subtitleLabel.text = subtitle
        tileView.imageView.image = UIImage(named: imageName)
    }
    
    // just a required method
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    // MARK: -  Style
    func style() {
        tileView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: -  Layout
    func layout() {
        view.addSubview(tileView)
        
        // Setting the tileView to the same dimensions as this TileViewController
        NSLayoutConstraint.activate([
            tileView.topAnchor.constraint(equalTo: view.topAnchor),
            tileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tileView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
}
