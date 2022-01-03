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
    
    private var homeNavController: ASDKNavigationController = {
        let title = "Home"
        let homeViewController = HomeViewController()
      
        let iconHome: SVGKImage = SVGKImage(named: "icon_home_rounded_deactive")
        let iconHomeSelected: SVGKImage = SVGKImage(named: "icon_home_rounded_active")
      
        homeViewController.title = "Home_VC"
        homeViewController.tabBarItem = UITabBarItem(title: title, image: iconHome.uiImage, selectedImage: iconHomeSelected.uiImage)
        
        return ASDKNavigationController(rootViewController: homeViewController)
    }()
    
    private var menuNavController: ASDKNavigationController {
        let title = "Menu"
        let menuNavController = MenuViewController()
        let iconMenu: SVGKImage = SVGKImage(named: "icon_menu_rounded_deactive")
        let iconMenuSelected: SVGKImage = SVGKImage(named: "icon_menu_rounded_active")
        
        menuNavController.title = "Menu_VC"
        menuNavController.tabBarItem = UITabBarItem(title: title, image: iconMenu.uiImage, selectedImage: iconMenuSelected.uiImage)

        
        return ASDKNavigationController(rootViewController: menuNavController)
    }
    
    private var cartNavController: ASDKNavigationController {
        let title = "Cart"
        let cartNavController = CartViewController()
        let iconCart: SVGKImage = SVGKImage(named: "icon_cart_rounded_deactive")
        let iconCartSelected: SVGKImage = SVGKImage(named: "icon_cart_rounded_active")
        
        cartNavController.title = "Cart_VC"
        cartNavController.tabBarItem = UITabBarItem(title: title, image: iconCart.uiImage, selectedImage: iconCartSelected.uiImage)
        
        
        return ASDKNavigationController(rootViewController: cartNavController)
    }
    
    private var profileNavController: ASDKNavigationController = {
        let title = "Profile"
        let profileNavController = ProfileViewController()
        let iconProfile: SVGKImage = SVGKImage(named: "icon_profile_rounded_deactive")
        let iconProfileSelected: SVGKImage = SVGKImage(named: "icon_profile_rounded_active")
    
       
        profileNavController.title = "Profile_VC"
        profileNavController.tabBarItem.tag = 4
        profileNavController.tabBarItem = UITabBarItem(title: title, image: iconProfile.uiImage, selectedImage: iconProfileSelected.uiImage)
        
        return ASDKNavigationController(rootViewController: profileNavController)
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        
        
        self.viewControllers = [
        homeNavController, menuNavController, cartNavController, profileNavController
        ]
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
