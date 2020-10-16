//
//  ViewController.swift
//  MobileJobEditor
//
//  Created by Osvaldo Garcia on 10/15/20.
//

import UIKit

class ViewController: UIViewController {
    
    var model = CustomerModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the Customers from the Customer Model
        model.delegate = self
        model.getCustomers()
    }
}

extension ViewController: CustomerModelProtocol {
    
    //MARK: - ARTICLE MODEL PROTOCOL METHODS
    
    func customersRetrieved(_ customer: [Customers]) {
        print("Customer Return from Model")
    }

}
