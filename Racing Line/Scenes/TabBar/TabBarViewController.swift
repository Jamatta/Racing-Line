//
//  TabBarViewController.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 21.01.24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = HomeViewController()
        let vc2 = RacingViewController()
        let vc3 = StandingViewController()
        let vc4 = CircuitViewController()
        let vc5 = VisualizeViewController()

        let nav1 = createNavigationController(for: vc1, title: "Home", imageName: "home_icon")
        let nav2 = createNavigationController(for: vc2, title: "Racing", imageName: "racing_icon")
        let nav3 = createNavigationController(for: vc3, title: "Standings", imageName: "standings_icon")
        let nav4 = createNavigationController(for: vc4, title: "Circuit", imageName: "circuit_icon")
        let nav5 = createNavigationController(for: vc5, title: "Visualize", imageName: "visualize_icon")

        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: true)
        
        customizeTabBarAppearance()
    }

    private func createNavigationController(for viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(named: imageName)
        // You can customize other navigation properties here
        return navigationController
    }
    
    private func customizeTabBarAppearance() {
           // Customize the appearance of the entire tab bar
        UITabBar.appearance().barTintColor = UIColor(AppColors.background) // Set your custom color
           UITabBar.appearance().tintColor = UIColor(AppColors.accentColor) // Set the color of selected items
           UITabBar.appearance().unselectedItemTintColor = UIColor(AppColors.textSecondary) // Set the color of unselected items
       }
}

