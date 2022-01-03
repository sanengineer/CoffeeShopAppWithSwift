//
//  MenuViewController.swift
//  CoffeeShopAppWithSwift
//
//  Created by San Engineer on 24/09/21.
//

import AsyncDisplayKit

class MenuViewController: ASDKViewController<ASDisplayNode> {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .yellow
        self.navigationController?.navigationBar.topItem?.title = "Menu"
      
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    
    private let homeNode: ASDisplayNode = {
        let homeNode = ASDisplayNode()
        
//        homeNode.backgroundColor = .purple
        homeNode.automaticallyManagesSubnodes = true
        homeNode.style.preferredSize = .init(width: 200, height: 200)
        
        homeNode.frame =  CGRect(x: 0, y: 0, width: homeNode.frame.width, height: 200)

        return homeNode
    }()
    
    private let redNode: ASDisplayNode = {
        let redNode = ASDisplayNode()
         redNode.backgroundColor = .red
         redNode.automaticallyManagesSubnodes = true
         redNode.style.preferredSize = .init(width: 100, height: 150)
         return redNode
    }()
    
    private let blueNode: ASDisplayNode = {
        let blueNode = ASDisplayNode()
         blueNode.backgroundColor = .blue
         blueNode.automaticallyManagesSubnodes = true
         blueNode.style.preferredSize = .init(width: 100, height: 150)
         return blueNode
    }()
    
    
    override init() {
        super.init(node: homeNode)
//        homeNode.backgroundColor = .gray
        homeNode.layoutSpecBlock = { node, constrainedSize -> ASLayoutSpec in
            return ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .start, children: [
                self.redNode,
                self.blueNode
            ])
        }

        print("POSITION:", homeNode.style.preferredLayoutSize)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
