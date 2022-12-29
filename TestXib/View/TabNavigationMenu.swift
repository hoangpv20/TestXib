//
//  TabNavigationMenu.swift
//  TestXib
//
//  Created by admin on 29/12/2022.
//

import UIKit

class TabNavigationMenu: UIView {
//    let tabItems: [TabItem] = []

    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
//    required init(menuItems: [TabItem], frame: CGRect) {
//        self.init(frame: frame)
//    }

}
