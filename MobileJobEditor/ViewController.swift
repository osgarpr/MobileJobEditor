//
//  ViewController.swift
//  MobileJobEditor
//
//  Created by Osvaldo Garcia on 10/15/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var CustomerTableView: UITableView!
    
    
    var model = CustomerModel()
    var customer = [Customers]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the viewcontroller as the delegate and datasource of the CustomerTableView
        CustomerTableView.delegate = self
        CustomerTableView.dataSource = self
        
        //Get the Customers from the Customer Model
        model.delegate = self
        model.getCustomers()
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //customer is traking an array of Customers, for the number of rows we will get the count
        return customer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Get a Cell
        let cell = CustomerTableView.dequeueReusableCell(withIdentifier: "CustomerCell", for: indexPath)
        
        //TODO: Customize the cell
        
        //Return the cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}




extension ViewController: CustomerModelProtocol {
    
    //MARK: - ARTICLE MODEL PROTOCOL METHODS
    
    func customersRetrieved(_ customer: [Customers]) {
        print("Customer Return from Model")
        
        //Set the customers property of the viewcontroller to the customers passed back from model
        self.customer = customer
        
        //Refresh the Customer table view
        CustomerTableView.reloadData()
        

    }

}
