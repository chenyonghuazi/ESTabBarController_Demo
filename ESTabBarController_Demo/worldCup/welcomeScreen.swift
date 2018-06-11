//
//  welcomeScreen.swift
//  ESTabBarController_Demo
//
//  Created by Edwin on 2018/6/10.
//  Copyright © 2018年 Edwin. All rights reserved.
//

import UIKit

class welcomeScreen: UIViewController {
    
    var timer:Timer?
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBarController?.tabBar.isHidden = true
        self.view.backgroundColor = UIColor.white
        guard let tabBarController = self.tabBarController?.tabBar else{return}
        tabBarController.isHidden = true
        guard let navigationBar = self.navigationController?.navigationBar else{return}
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.clear
        
        let imageV = UIImageView()
        self.view.addSubview(imageV)
        imageV.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *){
            imageV.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, trailing: self.view.trailingAnchor)
        }else{
            imageV.anchor(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor)
        }
        imageV.contentMode = .scaleAspectFill
        let image = #imageLiteral(resourceName: "welcome")
        imageV.image = image
        
        
        setTimer()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
    }
    
    @objc func handleTimer(){
        if timer != nil && count >= 2{
            let VC = guessVC()
            self.navigationController?.pushViewController(VC, animated: true)
            timer = nil
            count = 0
        }else{
            count += 1
        }
        
    }

}
