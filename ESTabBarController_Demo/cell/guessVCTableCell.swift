//
//  guessVCTableCell.swift
//  ESTabBarController_Demo
//
//  Created by Edwin on 2018/6/12.
//  Copyright © 2018年 Edwin. All rights reserved.
//

import UIKit

class guessVCTableCell: UITableViewCell {

    var leftScore = UILabel()
    var rightScore = UILabel()
    var middleSystem = UILabel()
    var leftTeam = UIImageView()
    var rightTeam = UIImageView()
    
    var leftTeamImage:String?
    var rightTeamImage:String?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(leftTeam)
        self.contentView.addSubview(rightTeam)
        self.contentView.addSubview(leftScore)
        self.contentView.addSubview(rightScore)
        self.contentView.addSubview(middleSystem)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLeftTeam()
        setupRightTeam()
        setupLeftScore()
        setupRightScore()
        setupMiddleSystem()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupLeftTeam(){
        
        leftTeam.translatesAutoresizingMaskIntoConstraints = false
        leftTeam.frame = CGRect(origin: .zero, size: .init(width: 50, height: 50))
        leftTeam.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        leftTeam.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        leftTeam.contentMode = .scaleAspectFit
        leftTeam.image = UIImage(named: leftTeamImage!)
        
    }
    
    func setupRightTeam(){
        
        rightTeam.translatesAutoresizingMaskIntoConstraints = false
        rightTeam.frame = CGRect(origin: .zero, size: .init(width: 50, height: 50))
        rightTeam.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8).isActive = true
        rightTeam.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        rightTeam.contentMode = .scaleAspectFit
        rightTeam.image = UIImage(named: rightTeamImage!)
        
    }
    
    func setupLeftScore(){
        
        leftScore.translatesAutoresizingMaskIntoConstraints = false
        leftScore.frame = CGRect(origin: .zero, size: .init(width: 50, height: 50))
        leftScore.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 160).isActive = true
        leftScore.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height / 2).isActive = true
        leftScore.font = leftScore.font.withSize(25)
    }
    func setupRightScore(){
        
        rightScore.translatesAutoresizingMaskIntoConstraints = false
        rightScore.frame = CGRect(origin: .zero, size: .init(width: 50, height: 50))
        rightScore.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -160).isActive = true
        rightScore.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height / 2).isActive = true
        rightScore.font = rightScore.font.withSize(25)
    }
    
    func setupMiddleSystem(){
        middleSystem.text = "-"
        middleSystem.translatesAutoresizingMaskIntoConstraints = false
        middleSystem.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        middleSystem.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height / 2).isActive = true
        middleSystem.font = middleSystem.font.withSize(25)
    }

}


























