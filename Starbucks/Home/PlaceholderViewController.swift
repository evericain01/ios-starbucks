//
//  TileView.swift
//  Starbucks
//
//  Created by Ebrahim Vericain on 2022-09-30.
//

import UIKit

class PlaceholderViewController: UIViewController {
    
    let label = UILabel()
    
    init(_ text: String) {
        super.init(nibName: nil, bundle: nil)
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        layout()
    }
    
    func layout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            // This center's the label horizontally and vertically
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            // Setting the height of this tile view
            view.heightAnchor.constraint(equalToConstant: 300)
            
        ])
    }
}
