//
//  StockViewController.swift
//  banK
//
//  Created by João Gabriel Lavareda Ayres Barreto on 03/10/23.
//

import Foundation
import UIKit

class StockViewController: UIViewController {
    var StockList: List?
    
    override func loadView() {
        self.StockList = List()
        
        self.view = self.StockList
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
}

