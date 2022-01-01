//
//  HomeView.swift
//  CoffeeShopAppWithSwift
//
//  Created by San Engineer on 24/09/21.
//

import UIKit

class HomeView: UIView {
    var main = UIScrollView()
    var _label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(main)
        setMainView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMainView(){
        main.addSubview(_label)
        _label.text = "Home"
    }
}
