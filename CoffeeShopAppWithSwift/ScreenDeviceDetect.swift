//
//  ScreenDeviceDetect.swift
//  CoffeeShopAppWithSwift
//
//  Created by San Engineer on 31/12/21.
//

import AsyncDisplayKit

var withNotchScreen: CGFloat {
    if #available(iOS 13.0, *){
        return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 34.0
    }
    
    return 0
}


