//
//  StarRewardsRow.swift
//  Starbucks
//
//  Created by Ebrahim Vericain on 2022-10-03.
//

import UIKit

class StarRewardsRow: UIView {
    
    let starAndPoints = StarAndPoints()
    let descriptionLabel = UILabel()
    
    init(numberOfPoints: String, description: String) {
        starAndPoints.pointsLabel.text = numberOfPoints
        descriptionLabel.text = description
        
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StarRewardsRow {
    // MARK: - Style
    func style() {
        starAndPoints.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.sizeToFit()
    }
    
    // MARK: - Layout
    func layout() {
        addSubview(starAndPoints)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            starAndPoints.topAnchor.constraint(equalTo: topAnchor),
            starAndPoints.leadingAnchor.constraint(equalTo: leadingAnchor),
            starAndPoints.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: starAndPoints.trailingAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        // If the UI element is getting expanded or squished, set content hugging priority (it will resist being stretched)
        starAndPoints.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        descriptionLabel.heightAnchor.constraint(equalToConstant: descriptionLabel.frame.size.height).setActiveBreakable()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 10, height: 16)
    }
    
}
