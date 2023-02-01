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
//        items[0].image = UIImage(named: images[0])
//        items[1].image = UIImage(named: images[1])
//        items[2].image = UIImage(named: "1")
//        items[2].selectedImage = UIImage(named: "1")
//        items[3].image = UIImage(named: images[3])
//        items[4].image = UIImage(named: images[4])
        
        UITabBar.appearance().tintColor = UIColor(named: "SelectedColor1")
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "UnselectedTextColor")
        UITabBar.appearance().backgroundColor = .white
        
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 5
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.2
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Sarabun-SemiBold", size: 10)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Sarabun-SemiBold", size: 10)!], for: .selected)
        items[2].imageInsets = UIEdgeInsets.init(top: 5, left: 0, bottom: -10, right: 0)
    }
}
extension UITabBarController {
    func addSubviewToLastTabItem(_ imageName: String) {
        if let lastTabBarButton = self.tabBar.subviews.last, let tabItemImageView = lastTabBarButton.subviews.first {
            if let accountTabBarItem = self.tabBar.items?.last {
                accountTabBarItem.selectedImage = nil
                accountTabBarItem.image = nil
            }
            let imgView = UIImageView()
            imgView.frame = tabItemImageView.frame
            imgView.layer.cornerRadius = tabItemImageView.frame.height/2
            imgView.layer.masksToBounds = true
            imgView.contentMode = .scaleAspectFill
            imgView.clipsToBounds = true
            imgView.image = UIImage(named: imageName)
            self.tabBar.subviews.last?.addSubview(imgView)
        }
    }
}
