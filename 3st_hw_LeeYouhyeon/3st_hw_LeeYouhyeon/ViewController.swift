//
//  ViewController.swift
//  3st_hw_LeeYouhyeon
//
//  Created by 이유현 on 9/19/24.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setTabBar()
    }
    
    func setTabBar(){
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = SearchViewController()
        let vc3 = ComingViewController()
        let vc4 = DownloadViewController()
        let vc5 = MoreViewController()
        
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        //선택 안 한 탭 아이템 색
        self.tabBar.unselectedItemTintColor = UIColor(red: 0.55, green: 0.53, blue: 0.53, alpha: 1)
        
        //선택된 탭 아이템 색
        self.tabBar.tintColor = .white
        self.tabBar.backgroundColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        
        guard let tabBarItems = self.tabBar.items else {return}
        //Assets에 있는 이미지를 탭바 아이콘으로 사용할 때는 named라고 바꿔줘야함!
        tabBarItems[0].image = UIImage(named: "home")
        tabBarItems[1].image = UIImage(named: "search")
        tabBarItems[2].image = UIImage(named: "comingSoon")
        tabBarItems[3].image = UIImage(named: "download")
        tabBarItems[4].image = UIImage(named: "more")
        
        
        tabBarItems[0].title = "Home"
        tabBarItems[1].title = "Search"
        tabBarItems[2].title = "Coming Soon"
        tabBarItems[3].title = "Downloads"
        tabBarItems[4].title = "More"
        
        
    }


}

