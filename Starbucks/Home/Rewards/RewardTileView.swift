//
//  RewardTileView.swift
//  Starbucks
//
//  Created by Ebrahim Vericain on 2022-10-02.
//

import UIKit

class RewardTileView: UIView {
    
    let balanceView = BalanceView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Giving the reward tile an intrinsic size
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 300)
    }
}

extension RewardTileView {
    
    func style() {
        balanceView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        addSubview(balanceView)
        
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: topAnchor),
            balanceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5)
        
        ])
    }
}
