//
//  OrganizationListCell.swift
//  BrowserApp
//
//  Created by Eren Erten on 18.07.2023.
//

import UIKit
import Kingfisher

class OrganizationListTableViewCell: UITableViewCell {
    
    private var mainStackView:UIStackView!
    private var loginNameLabel:UILabel!
    private var avatarImageView:UIImageView = UIImageView()
    private var starImageView:UIImageView = UIImageView()
    
    init(){
        super.init(style: .default, reuseIdentifier: "organizationListTableViewCell")
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func assignValues(organization:OrganizationModel)
    {
       
        self.loginNameLabel.text = organization.loginName
        self.starImageView.image = organization.isFavorite ? UIImage(systemName: "star.fill"):UIImage(systemName: "star")
        avatarImageView.kf.setImage(with: organization.avatarURL)
    }
    func setupViews() {
        mainStackView = makeStackView(withOrientation: .horizontal, distribution: .fill)
        self.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.heightAnchor.constraint(equalTo: super.heightAnchor),
            mainStackView.widthAnchor.constraint(equalTo: super.widthAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: super.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: super.centerYAnchor)
        ])
        
        loginNameLabel = makeLabel(withText: "")
        
        avatarImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        starImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        starImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        mainStackView.addArrangedSubview(avatarImageView)
        mainStackView.addArrangedSubview(loginNameLabel)
        mainStackView.addArrangedSubview(starImageView)
        
        loginNameLabel.setContentHuggingPriority(.required, for: .vertical)
        
        avatarImageView.setContentCompressionResistancePriority(.required, for: .vertical)
        starImageView.setContentCompressionResistancePriority(.required, for: .vertical)
    }
}
