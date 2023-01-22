//
//  SideMenuNavigator.swift
//  MainPageOrang
//
//  Created by 김연진 on 2023/01/22.
//

import Foundation
import UIKit
import SideMenu


class SideMenuNavigation: SideMenuNavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presentationStyle = .menuSlideIn
        
    }
}
