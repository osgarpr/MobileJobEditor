//
//  CustomerModel.swift
//  MobileJobEditor
//
//  Created by Osvaldo Garcia on 10/15/20.
//

import Foundation

protocol CustomerModelProtocol {
    func customersRetrieved(_ customer:[Customers])
}

class CustomerModel {
    
    var delegate:CustomerModelProtocol?
    
    func getCustomers() {
        
        //Postman code
        
        var semaphore = DispatchSemaphore (value: 0)

        let parameters = "Select * from Customer startposition 1 maxresults 5"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365146526490/query?minorversion=14")!,timeoutInterval: Double.infinity)
        request.addValue("QBOV3-OAuth2-Postman-Collection", forHTTPHeaderField: "User-Agent")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/text", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..t7SFn6-H_zELiagBuj9Siw.edZiL8GclH0Tn_C3OZ1-bI1y8VDgPahvt8iqIuBMDh9tvK4GyeUSBh-SJu4tzenERsttaXJT1dVI8rfhNkGHuc-FKMS7Qj0Um-SNWGjBoX3cKIdBI7ekzaAdgnHGRoGNYx9lDyTa0Wn55LtBtCR5x6SJAr9L5GToemYbdOau5bkbt-Yluw7FlkAHyefYmXGNS4bV4_uiQMzWX_AaZRpblOzXF59a9ZwkxdxRJ1pUuEEf8q74zQh3Q03Xmg7cFp3hKQ53218FQxm1JW5uS0SftVUGTv9lglFejDKL2PCG_VBb5hDHvqMRtcj4Qmq3V5gKYPKpF0pbFcUXNbrOnAgRMvjJF--1AM8FheKiRbDx6DECq9p9JreNlPRbmiX7Q8LeG5dW9Uk1UTMo035c0B1b_xwIIspcZEQOWbWl5vQC2yvUpsNzwWI_TVmnbKmuxwRwktv8bkCbsjJ3jDLSCOzA5pkBYk3btHt7-rUzR0IXtWcY0YYXAOf-5JVV6TfLK62KpZphh2lUsWGL56F9H7W08WeY1HnopN8c1LOSpHmRfEfj24gC7soxEaNhzDczn0INVErHMbk_8w9WAqCy--Uq9cmki5fPmlHcHlQWiB1ZfAkTtsgqBfbq6a-FBu7LC4KE2zSNekQu6sbYJCBf7F4yl3bSnoK4V97zSVMlW2K4rRGoDWP-albjZnMI16u6G8hJChaNJMPBJzH0DXofcKcipsqF-yMOHpxqQA-o96xVNC062tGF2R7mngwt7Q_n_UfIT9LQrbk_DwFxVInGYli9NIZ7ZzrmVTA7NdLdRRljz12TNTX9HGGy5UDhskRgKth0AXCA5mUVpmFV23WzjRFKxzP7NrmsrRLRFPcYJNJKJ-c.2V6TK_eO_kvelyKQhNlsuA", forHTTPHeaderField: "Authorization")
        request.addValue("ivid_b=4d819af5-2e7d-4644-ac54-b4f8b340e98f; ivid=29b2c6f2-116c-420f-9f11-a66523c9d5a7; ius_session=D3D7F6A8103F4FA8A38542FC89E30DF4; ajs_anonymous_id=%2229b2c6f2-116c-420f-9f11-a66523c9d5a7%22; s_cc=true; s_fid=1A47625E2BD5F23A-250EB817122EA98B; did=SHOPPER2_0a570de5eec5ba072b35d63be219e74828c2a65710e09c6dcb5949cd402a6786a0481b6843418ffb6c4bee4829280532; s_vi=[CS]v1|2FC42F9A8515E2F4-400006D647E480DD[CE]; qbn.authid=123145701344802; qbn.gauthid=123145701344802; qbn.agentid=123145701344802; qbn.uidp=1b9ccc8c01ac7445e8ef959fae2b69a3c; qbn.parentid=50000003; userIdentifier=123145701344802; ius_at.enabled=true; ius_at=1602772813168; akid=gip184.84.70.121_gsip184.28.36.189_clip24.50.203.209_rclip24.50.203.209; ajs_user_id=null; ajs_group_id=null; s_sq=%5B%5BB%5D%5D; qbn.ticket=V1-6-X0nsrw1tf3qobzob8k4j7p; qbn.tkt=V1-6-X0nsrw1tf3qobzob8k4j7p; qbn.glogin=osgarpr%40gmail.com; qbn.account_chooser=gNhFIdaZ3ZUUka0ZNFm-LJCNs2XVCjpSsT8ZAwoDMRoTEjaonovqOd7OkCBtQQvkS9OB2NCnoA0V9sl5FMIQzbbztc9ir3k22yEe5XV2wZQ8BZSUp1r6swAQ6jQMDzuWU9E3Ky2EJxmxVvzLUPl5qlYt3dcWRevHtoVonQYOd3zJUhzs9d5Lrv1iyf-qKT2xhMY8UjLPX9wRmI551D0SkBfJuMC14ofC; ADRUM=s=1602804395332&r=https%3A%2F%2Faccounts.intuit.com%2Findex.html%3F-447314082; websdk_swiper_flags=", forHTTPHeaderField: "Cookie")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        
        delegate?.customersRetrieved([Customers]())

    }
}
