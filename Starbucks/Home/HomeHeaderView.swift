//
//  HomeHeaderView.swift
//  Starbucks
//
//  Created by Ebrahim Vericain on 2022-09-29.
//

import UIKit

// Class for the header of the home page
class HomeHeaderView: UIView {
    
    let greeting = UILabel()
    let inboxButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeHeaderView {
    
    // MARK: - Style
    func style() {
        greeting.translatesAutoresizingMaskIntoConstraints = false
        greeting.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greeting.text = "Good afternoon, Ebra!"
        greeting.numberOfLines = 0
        greeting.lineBreakMode = .byWordWrapping
        
        inboxButton.translatesAutoresizingMaskIntoConstraints = false
        inboxButton.setTitleColor(.label, for: .normal)
        inboxButton.setTitle("Inbox", for: .normal)
    }
    
    // MARK: - Layout
    func layout() {
        addSubview(greeting)
        addSubview(inboxButton)
        
        NSLayoutConstraint.activate([
            greeting.topAnchor.constraint(equalTo: topAnchor),
            greeting.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            greeting.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            inboxButton.topAnchor.constraint(equalTo: greeting.bottomAnchor, constant: 5),
            inboxButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            inboxButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    
}
