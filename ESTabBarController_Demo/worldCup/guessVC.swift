//
//  guessVC.swift
//  ESTabBarController_Demo
//
//  Created by Edwin on 2018/6/10.
//  Copyright © 2018年 Edwin. All rights reserved.
//

import UIKit

class guessVC: UIViewController {

    
    var tableV = UITableView()
    var segementControl = UISegmentedControl()
    
    var sections:[String:[String:String]] = [String:[String:String]]()
    let day1:[String:String] = ["lakeluniya.png":"bettys.png"]
    let day2:[String:String] = ["bettys.png":"royalSociety.png"]
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sections["2018-02-12周一"] = day1
        sections["2018-03-01周四"] = day2
        setNavigationControllerBackground()
        self.tableV.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        guard let tabBarController = self.tabBarController?.tabBar else{return}
        tabBarController.isHidden = false
        setSegementedControl()
        
        // tableView
        registerCell()
        tableV.delegate = self
        tableV.dataSource = self
        self.view.addSubview(tableV)
        tableV.translatesAutoresizingMaskIntoConstraints = false
        
        constraintForTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNavigationControllerBackground(){
        self.title = "World Cup 狂欢"
//        navigationItem.titleView.
        guard let navigationC = self.navigationController else{return}
        
        navigationItem.hidesBackButton = true
        navigationC.navigationBar.shadowImage = UIImage()
        navigationC.navigationBar.tintColor = .white
        navigationC.navigationBar.barStyle = .black
        navigationC.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationC.navigationBar.setBackgroundImage(UIImage(named: "background_dark"), for: .default)
        
    }
    
    func setViewBackgroundImage(){
//        let imageV = UIImageView(frame: UIScreen.main.bounds)
//        imageV.contentMode = .scaleAspectFill
//        imageV.image = UIImage(named: "background_dark")
//        self.view.insertSubview(imageV, at: 0)
//        let navigationBar = self.navigationController?.navigationBar
//        navigationBar?.barTintColor = UIColor(patternImage: UIImage(named: "background_dark")!)
    }
    
    func setSegementedControl(){
        
        let items = ["16强","8强","4强","决赛"]
//        var segementControl = UISegmentedControl()
        segementControl = UISegmentedControl(items: items)
        
        let backgroundColor = UIColor.init(red: 0/255, green: 83/255, blue: 109/255, alpha: 1)
        segementControl.backgroundColor = backgroundColor
        segementControl.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for: .selected)
        segementControl.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.lightGray], for: .normal)
        segementControl.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .highlighted)
        segementControl.selectedSegmentIndex = 0
        segementControl.tintColor = .clear
        segementControl.removeBorders()
        self.view.addSubview(segementControl)
        segementControl.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *){
            segementControl.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, leading: self.view.leadingAnchor, bottom: nil, trailing: self.view.trailingAnchor, size: .init(width: 0, height: 44))
        }else{
            segementControl.anchor(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: nil, trailing: self.view.trailingAnchor, size: .init(width: 0, height: 44))
        }
        
    }
}
extension guessVC:UITableViewDelegate, UITableViewDataSource{
    func registerCell(){
        self.tableV.register(guessVCTableCell.self, forCellReuseIdentifier: "guessCell")
        self.tableV.reloadData()
    }
    
    func constraintForTableView(){
        guard let tabBarController = self.tabBarController?.tabBar else{return}
        self.tableV.anchor(top: self.segementControl.bottomAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "guessCell") as! guessVCTableCell
        if indexPath.section == 0{
            cell.leftScore.text = "0"
            cell.rightScore.text = "1"
            if let leftImage = sections["2018-02-12周一"]?.keys.first{
                
                print(leftImage)
                cell.leftTeamImage = leftImage
            }
            if let rightImage = sections["2018-02-12周一"]?.values.first{
                print(rightImage)
                cell.rightTeamImage = rightImage
            }
            
        }else if indexPath.section == 1{
            cell.leftScore.text = "0"
            cell.rightScore.text = "0"
            cell.leftTeamImage = sections["2018-03-01周四"]?.keys.first
            cell.rightTeamImage = sections["2018-03-01周四"]?.values.first
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return sections.keys.first
        }else{
            let sectionskey = Array(sections.keys)
            
            return sectionskey[1]
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
}
