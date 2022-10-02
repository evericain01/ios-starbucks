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
    var inboxButton = UIButton()
    
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
        greeting.text = "Good afternoon, Kai!"
        greeting.numberOfLines = 0
        greeting.lineBreakMode = .byWordWrapping
        
        makeInboxButton()
    }
    
    // MARK: - Layout
    func layout() {
        addSubview(greeting)
        addSubview(inboxButton)
        
        NSLayoutConstraint.activate([
            greeting.topAnchor.constraint(equalTo: topAnchor),
            greeting.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            greeting.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            inboxButton.topAnchor.constraint(equalTo: greeting.bottomAnchor, constant: 10),
            inboxButton.leadingAnchor.constraint(equalTo: greeting.leadingAnchor),
            inboxButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            inboxButton.widthAnchor.constraint(equalToConstant: 85)

        ])
    }
}

// MARK: - Factories
extension HomeHeaderView {

    // Setting up the button
    func makeInboxButton() {
        inboxButton.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "envelope", withConfiguration: configuration)
        
        inboxButton.setImage(image, for: .normal)
        inboxButton.setTitle("Inbox", for: .normal)
        inboxButton.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)
        inboxButton.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        inboxButton.layer.cornerRadius = 5.5
    }
}

