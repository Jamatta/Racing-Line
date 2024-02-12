//
//  TabBarViewController.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 21.01.24.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = HomeViewController()
        let vc2 = RacingViewController()
        let vc3 = StandingViewController()
        let vc4 = CircuitViewController()
        let vc5 = VisualizeViewController()
        
        let nav1 = createNavigationController(for: vc1, title: "Home", imageName: "house.fill")
        let nav2 = createNavigationController(for: vc2, title: "Racing", imageName: "flag.checkered")
        let nav3 = createNavigationController(for: vc3, title: "Standings", imageName: "trophy.fill")
        let nav4 = createNavigationController(for: vc4, title: "Circuit", imageName: "visionpro")
        let nav5 = createNavigationController(for: vc5, title: "Visualize", imageName: "play.tv.fill")
        
        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: true)
        
        customizeTabBarAppearance()
    }
    
    //MARK: - Methods
    private func createNavigationController(for viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(systemName: imageName)
        return navigationController
    }
    
    private func customizeTabBarAppearance() {
        UITabBar.appearance().barTintColor = UIColor(AppColors.background)
        UITabBar.appearance().tintColor = UIColor(AppColors.accentColor)
        UITabBar.appearance().unselectedItemTintColor = UIColor(AppColors.textSecondary)
        UITabBar.appearance().backgroundColor = UIColor(AppColors.background)
    }
}

