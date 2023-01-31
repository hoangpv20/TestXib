//
//  TabbarViewController.swift
//  TestXib
//
//  Created by admin on 31/01/2023.
//

import UIKit

class TabbarViewController: UITabBarController {

    let mainVC = HomeViewController()
    let favoriteVC = FavoriteViewController()
    let liveVC = LiveStreamViewController()
    let rankingVC = RankingViewController()
    let personalVC = PersonalAccountViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationItem.backBarButtonItem?.tintColor = .black
        
        mainVC.title = "Home"
        favoriteVC.title = "Follow"
        rankingVC.title = "Ranking"
        personalVC.title = " Cá nhân"
        
        self.setViewControllers([mainVC, favoriteVC, liveVC, rankingVC, personalVC], animated: false)
        
        guard let items = self.tabBar.items else { return }
        let images = ["HomeIcon", "FollowIcon", "LiveIcon", "RankingIcon", "SmileIcon"]
        
        for i in 0...4 {
            items[i].image = UIImage(named: images[i])
        }
        UITabBar.appearance().tintColor = .purple
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "UnselectedTextColor")
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().layer.shadowOffset = CGSize(width: 0, height: 0)
        UITabBar.appearance().layer.shadowRadius = 5
        UITabBar.appearance().layer.shadowColor = UIColor.black.cgColor
        UITabBar.appearance().layer.shadowOpacity = 0.2
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Sarabun-SemiBold", size: 10)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Sarabun-SemiBold", size: 10)!], for: .selected)
        items[2].imageInsets = UIEdgeInsets.init(top: 5, left: 0, bottom: -10, right: 0)
    }
    
}
