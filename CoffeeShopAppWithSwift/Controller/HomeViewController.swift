//
//  HomeViewController.swift
//  CoffeeShopAppWithSwift
//
//  Created by San Engineer on 24/09/21.
//

import AsyncDisplayKit

class HomeViewController: ASDKViewController<ASDisplayNode> {
    
//    private let homeNode: ASDisplayNode = {
//       let homeNode = ASDisplayNode()
//        homeNode.backgroundColor = .purple
//        homeNode.automaticallyManagesSubnodes = true
//        return homeNode
//    }()
    
    private let homeNode: ASScrollNode = {
        let homeNode = ASScrollNode()
        
        homeNode.backgroundColor = .purple
        homeNode.automaticallyManagesSubnodes = true
        homeNode.automaticallyManagesContentSize = true
        
        return homeNode
    }()
    
    private let redNode: ASDisplayNode = {
        let redNode = ASDisplayNode()
         redNode.backgroundColor = .red
         redNode.automaticallyManagesSubnodes = true
         redNode.style.preferredSize = .init(width: 100, height: 100)
         return redNode
    }()
    
    private let blueNode: ASDisplayNode = {
        let blueNode = ASDisplayNode()
         blueNode.backgroundColor = .blue
         blueNode.automaticallyManagesSubnodes = true
         blueNode.style.preferredSize = .init(width: 100, height: 100)
         return blueNode
    }()
    
    
    override init() {
        super.init(node: homeNode)
        
        homeNode.layoutSpecBlock = { node, constrainedSize -> ASLayoutSpec in
            return ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .start, children: [
                self.redNode,
                self.blueNode
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.topItem?.title = "Ha"
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
    }

}
