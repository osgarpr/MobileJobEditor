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
        request.addValue("Bearer eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..YLKZ3reBAwmtpqUYXdcH2w.YUtb4JliVrLlILoYCrBpsOLce79wBqO0h9kGBKCJs23FdpLj5794ZWulcnQEi3z8KcZTiyelLOPjpR6HgLEoZxCVqT4pi7HrE77p8eOWpZF_x3VsDLjvM9nOethDLRc2SW8ssRTdGeNliA77YDr0XOe90e87n9ozLfJ4yOSDhEOG2o7Eta_taYgm4hOJTWNSbzMrUOyQdjoKIlT0o-STiFkiSksAHgGuQwI-2tO-JdJjM7EyK4wkjpdmCNgCd8PmjB_j5vhk0SUJGdejoc8m0Xt-TxzyL0QWnPFG1wxeDilhhLsL0ehKZpx_sQh0mR2y_SPs7COjmG6uPMWRUOCIXO_sU0xYmTIUlLQULDef6wvK6OJBSB67M8O4d_smSrS3677olcjdobUqiZZLWPIQhzuFbAELJPQFUuW2-_c3j3rpSzE4X35aCZhzTcZAsd0fRbESo4UkZQHHn3GlrhjeEUvWrKVA9mr8h1owHmqY-6aQD-J27f62vVfsXUgPD7gcbVaL3OZH9OjWQYDgIATrvX-lJqd7Mg9Z7MaM4xDlka57YrBmYDA2SwCZnSv33-qIGDHhiDJP4a21q0nrsGQrNbaiO2r_IWrrDaYAJFzL4Iu-Y4XIN0jR_sCdHHlQwEqiH3XHTuKn4dF91-Wv1g2lu5nI27-fLyjY-O-4sbZ8-YXADmVPNY1Lox_aQq9Wjx8ct7xxPm2sVMpGDVY_v6YCPuean7R-UkTMCnsMWvQTRg38hP9OMHvgzKR7_frkVV8BS_8WnQjWNuVrHJ4_7jVP3Or9PyPY3qCzp31sF_-h3emcSZKzr2_hJp1rgFxlmkyXvUTsRl7yRcnqRRMF7zPfN0Q-tES9q5C78_msD8BafEI.Y_bOTy9uja8u0Ao61KE8bA", forHTTPHeaderField: "Authorization")
        request.addValue("ivid_b=4d819af5-2e7d-4644-ac54-b4f8b340e98f; ivid=29b2c6f2-116c-420f-9f11-a66523c9d5a7; ius_session=D3D7F6A8103F4FA8A38542FC89E30DF4; ajs_anonymous_id=%2229b2c6f2-116c-420f-9f11-a66523c9d5a7%22; s_cc=true; s_fid=1A47625E2BD5F23A-250EB817122EA98B; did=SHOPPER2_0a570de5eec5ba072b35d63be219e74828c2a65710e09c6dcb5949cd402a6786a0481b6843418ffb6c4bee4829280532; s_vi=[CS]v1|2FC42F9A8515E2F4-400006D647E480DD[CE]; qbn.authid=123145701344802; qbn.gauthid=123145701344802; qbn.agentid=123145701344802; qbn.uidp=1b9ccc8c01ac7445e8ef959fae2b69a3c; qbn.parentid=50000003; userIdentifier=123145701344802; ius_at.enabled=true; ius_at=1602772813168; ajs_user_id=null; ajs_group_id=null; qbn.glogin=osgarpr%40gmail.com; akid=gip104.122.150.250_gsip184.28.114.103_clip24.50.203.209_rclip24.50.203.209; s_sq=%5B%5BB%5D%5D; qbn.ticket=V1-241-X0mso5h7ja7kviw6hhifmj; qbn.tkt=V1-241-X0mso5h7ja7kviw6hhifmj; qbn.account_chooser=yBggmRvV-TrIJWGBZMvOcxbsESmxUO1TuaPAS7_CXIgYogf1V3Ao6t3PbNbRBZJd1wzYbHDJ90n_qJJSdu6qpXB7VhWCEY0xGNmWJ80vAXj8-nM7EELD052OMrcbXBuFtO4oZfII145drB781uWQChG5iGWil6bBuaPQjD1YgYW5KyRuTv7XIq-dxqLuEe7KUhUa8V5vAmGHod2EdvGagQGzASh9gTPu; ADRUM=s=1602845260255&r=https%3A%2F%2Faccounts.intuit.com%2Findex.html%3F-447314082; websdk_swiper_flags=", forHTTPHeaderField: "Cookie")

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
