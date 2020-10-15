//
//  Customer.swift
//  MobileJobEditor
//
//  Created by Osvaldo Garcia on 10/15/20.
//

import Foundation

struct Customers : Codable {
    
    var PrimaryEmailAddr:[EmailChild]?
    var SyncToken:String?
    var domain:String?
    var GivenName:String?
    var DisplayName:String?
    var BillWithParent:Bool?
    var FullyQualifiedName:String?
    var CompanyName:String?
    var FamilyName:String?
    var sparse:Bool?
    var PrimayPhone:[PrimaryPhoneChild]?
    var Active:Bool?
    var Job:Bool?
    var BalanceWithJobs:Int?
    var BillAddr:[BillAddrChild]?
    var PreferredDeliveryMethod:String?
    var Taxable:Bool?
    var PrintOnCheckName:String?
    var Balance:Int?
    var Id:String?
    var MetaData:[MetaDataChild]?
    var MiddleName:String?
}

struct EmailChild : Codable {
    var Address:String?
}

struct PrimaryPhoneChild : Codable {
    var FreeFormNumber:String?
}
 
struct BillAddrChild : Codable {
    var City:String?
    var Line1:String?
    var PostalCode:String?
    var Lat:String?
    var Long:String?
    var CountrySubDivisionCode:String?
    var Id:String?
    
}

struct MetaDataChild : Codable {
    var CreateTime:String?
    var LastUpdatedTime:String?
    
}
