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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationControllerBackground()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        guard let tabBarController = self.tabBarController?.tabBar else{return}
        tabBarController.isHidden = false
        setSegementedControl()
        
        // Do any additional setup after loading the view.
        tableV.delegate = self
        self.view.addSubview(tableV)
        tableV.translatesAutoresizingMaskIntoConstraints = false
        
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
        let segementControl = UISegmentedControl(items: items)
        
        let backgroundColor = UIColor.init(red: 8/255, green: 76/255, blue: 107/255, alpha: 1)
        segementControl.backgroundColor = backgroundColor
        segementControl.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for: .selected)
        segementControl.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.lightGray], for: .normal)
        segementControl.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .highlighted)
        segementControl.selectedSegmentIndex = 0
        
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
}
