//
//  OutingViewController.swift
//  GOMS-iOS
//
//  Created by 선민재 on 2023/04/18.
//

import UIKit

class OutingViewController: BaseViewController<OutingViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItems()
        self.navigationItem.leftLogoImage()
    }
    
    override func addView() {
        [].forEach {
            
        }
    }
    
    override func setLayout() {
        
    }

}
