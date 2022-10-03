//
//  RewardTileView.swift
//  Starbucks
//
//  Created by Ebrahim Vericain on 2022-10-02.
//

import UIKit

class RewardsTileView: UIView {
    
    let balanceView = BalanceView()
    var rewardsButton = UIButton()
    let rewardsGraphsView = RewardsGraphView()
    let starRewardsView = StarRewardsView()
    var detailsButton = UIButton()
    
    var heightConstraint: NSLayoutConstraint?
    
    
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

extension RewardsTileView {
    
    // MARK: - Style
    func style() {
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        rewardsGraphsView.translatesAutoresizingMaskIntoConstraints = false
        starRewardsView.translatesAutoresizingMaskIntoConstraints = false
        
        makeRewardsOptionButton()
        
        detailsButton = makeClearButton(withText: "Details")        
    }
    
    // MARK: - Rewards Button
    func makeRewardsOptionButton() {
        rewardsButton.translatesAutoresizingMaskIntoConstraints = false
        rewardsButton.addTarget(self, action: #selector(rewardOptionsTapped), for: .primaryActionTriggered)
        
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.down", withConfiguration: configuration)
        
        rewardsButton.setImage(image, for: .normal)
        rewardsButton.imageView?.tintColor = .label
        rewardsButton.imageView?.contentMode = .scaleAspectFit
        
        rewardsButton.setTitle("Rewards options", for: .normal)
        rewardsButton.setTitleColor(.label, for: .normal)
        rewardsButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        rewardsButton.semanticContentAttribute = .forceRightToLeft
//        rewardsButton.imageEdgeInsets = UIEdgeInsets(top: 2, left: 20, bottom: 0, right: 0)
//        rewardsButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        

    }
    
    // MARK: - Layout
    func layout() {
        addSubview(balanceView)
        addSubview(rewardsButton)
        addSubview(rewardsGraphsView)
        addSubview(starRewardsView)
        addSubview(detailsButton)
        
        // Setting the height of
        heightConstraint = starRewardsView.heightAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: topAnchor),
            balanceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            rewardsButton.centerYAnchor.constraint(equalTo: balanceView.pointsLabel.centerYAnchor),
            rewardsButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -7),

            rewardsGraphsView.topAnchor.constraint(equalTo: balanceView.bottomAnchor, constant: 5),
            rewardsGraphsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            rewardsGraphsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
//            rewardsGraphsView.heightAnchor.constraint(equalToConstant: 100),
//            rewardsGraphsView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            rewardsGraphsView.widthAnchor.constraint(equalToConstant: frame.width),

            starRewardsView.topAnchor.constraint(equalTo: rewardsGraphsView.bottomAnchor, constant: 5),
            starRewardsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            starRewardsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 2),
            heightConstraint!,

            detailsButton.topAnchor.constraint(equalTo: starRewardsView.bottomAnchor, constant: 8),
            detailsButton.leadingAnchor.constraint(equalTo: balanceView.leadingAnchor, constant: 5),
            detailsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 2)
        
        ])
        
        // Making the star rewards view hidden
        starRewardsView.isHidden = true
    }
    
    // Redraw out graph once we know our actual device width & height
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rewardsGraphsView.actualFrameWidth = frame.width
        rewardsGraphsView.drawRewardsGraph()
        
    }
}

// MARK: - Actions
extension RewardsTileView {
    @objc func rewardOptionsTapped() {
        
        if heightConstraint?.constant == 0 {
            // When it's not collapsed
            self.setChevronUp()
            
            let heightAnimator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
                self.heightConstraint?.constant = 270
                self.layoutIfNeeded()
            }
            
            heightAnimator.startAnimation()
            
            // Changing the alpha of the star rewards view 
            let alphaAnimator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) {
                self.starRewardsView.isHidden = false
                self.starRewardsView.alpha = 1
            }
            
            alphaAnimator.startAnimation(afterDelay: 0.5)
        } else {
            // When it's collapsed
            self.setChevronDown()
            
            let animator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
                self.heightConstraint?.constant = 0
                self.starRewardsView.isHidden = true
                self.starRewardsView.alpha = 0
                self.layoutIfNeeded()
            }
            animator.startAnimation()
        }
    }
    
    @objc func detailsButtonTapped() {
        print("Details tapped!!!")
    }
    
    // Function that sets the chevron up image
    private func setChevronUp() {
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.up", withConfiguration: configuration)
        rewardsButton.setImage(image, for: .normal)
    }
    
    // Function that sets the chevron down image
    private func setChevronDown() {
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.down", withConfiguration: configuration)
        rewardsButton.setImage(image, for: .normal)
    }
    
    
}

