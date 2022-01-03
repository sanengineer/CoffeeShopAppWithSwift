//
//  Product.swift
//  CoffeeShopAppWithSwift
//
//  Created by San Engineer on 02/01/22.
//

import AsyncDisplayKit

struct Product {
    let title: String?
    let price: String?
//    let image: UIImage?
    
    func generateDummyProduct() -> [Product] {
        let product_1 = Product(title: "Double Shot Coffee - 250 ml", price: "Rp. 30.000")

        return [product_1, product_1, product_1, product_1, product_1, product_1, product_1, product_1]
    }
}
