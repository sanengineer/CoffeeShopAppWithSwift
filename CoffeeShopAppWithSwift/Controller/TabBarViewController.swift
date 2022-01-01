//
//  TabBarViewController.swift
//  CoffeeShopAppWithSwift
//
//  Created by San Engineer on 24/09/21.
//

import AsyncDisplayKit
import SVGKit


class TabBarViewController: ASTabBarController {
    
    let appearance = UITabBarItem.appearance()
    let _navBar = UINavigationItem()
    let attributes = [NSAttributedString.Key.font:UIFont(name: "CircularStd-Book", size: 12)]
    let attributesDefaultFontBold = [NSAttributedString.Key.font:UIFont(name: "CircularStd-Bold", size: 12)]
    
    private var homeNavController: UIViewController = {
        let title = "Home"
        let homeViewController = HomeViewController()
        let homeNav = UINavigationBar()
        let titleNav = UILabel()
        
        let iconHome: SVGKImage = SVGKImage(named: "icon_home_rounded_deactive")
        let iconHomeSelected: SVGKImage = SVGKImage(named: "icon_home_rounded_active")
        
        if #available(iOS 11.0, *) {
            homeViewController.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        }

        homeViewController.tabBarItem = UITabBarItem(title: title, image: iconHome.uiImage, selectedImage: iconHomeSelected.uiImage)
        
        return ASDKNavigationController(rootViewController: homeViewController)
    }()
    
    private var menuNavController: UIViewController {
        let title = "Menu"
        let menuNavController = MenuViewController()
        let iconMenu: SVGKImage = SVGKImage(named: "icon_menu_rounded_deactive")
        let iconMenuSelected: SVGKImage = SVGKImage(named: "icon_menu_rounded_active")
        
        menuNavController.title = title
        menuNavController.tabBarItem = UITabBarItem(title: title, image: iconMenu.uiImage, selectedImage: iconMenuSelected.uiImage)

        
       
        return menuNavController
    }
    
    private var cartNavController: UIViewController {
        let title = "Cart"
        let titleNav = UILabel()
        let cartNavController = CartViewController()
        let iconCart: SVGKImage = SVGKImage(named: "icon_cart_rounded_deactive")
        let iconCartSelected: SVGKImage = SVGKImage(named: "icon_cart_rounded_active")
        
        titleNav.textColor = UIColor(ciColor: CIColor(red: 1.0, green: 0.0, blue: 1.0))
        titleNav.text = title
        
        cartNavController.title = "Oke"
        cartNavController.navigationItem.title = titleNav.text
        cartNavController.tabBarItem = UITabBarItem(title: title, image: iconCart.uiImage, selectedImage: iconCartSelected.uiImage)
        
        
        return cartNavController
    }
    
    private var profileNavController: UIViewController {
        let title = "Profile"
        let profileNavController = ProfileViewController()
        let iconProfile: SVGKImage = SVGKImage(named: "icon_profile_rounded_deactive")
        let iconProfileSelected: SVGKImage = SVGKImage(named: "icon_profile_rounded_active")
    
       
        profileNavController.tabBarItem.tag = 4
        
        profileNavController.tabBarItem = UITabBarItem(title: title, image: iconProfile.uiImage, selectedImage: iconProfileSelected.uiImage)

        
        return profileNavController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        
        
        homeNavController.navigationController?.navigationBar.topItem?.title = "Ha"
        if #available(iOS 11.0, *) {
            homeNavController.navigationController?.navigationBar.prefersLargeTitles = true
        } 
        
        self.viewControllers = [
        homeNavController, menuNavController, cartNavController, profileNavController
        ]
    }
    
    override func viewDidLoad() {
        homeNavController.navigationItem.title = "Hola"
    }
    
    override var selectedIndex: Int {
        didSet {
            guard let selectedViewController = viewControllers?[selectedIndex] else {
                return
            }
            
            selectedViewController.tabBarItem.setTitleTextAttributes(attributesDefaultFontBold as [NSAttributedString.Key: Any], for: .normal)
         
        }
    }
    
    override var selectedViewController: UIViewController? {
        didSet {
            guard let viewControllers = viewControllers else {
                return
            }
            
            for viewController in viewControllers {
                if viewController == selectedViewController {
                    viewController.tabBarItem.setTitleTextAttributes(attributesDefaultFontBold as [NSAttributedString.Key: Any], for: .normal)
                } else {
                    viewController.tabBarItem.setTitleTextAttributes(attributes as [NSAttributedString.Key: Any], for: .normal)
                }
            }
        }
    }
}
