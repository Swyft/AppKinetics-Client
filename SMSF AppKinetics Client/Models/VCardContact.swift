//
//  VCardContact.swift
//  SMSF AppKinetics Client
//
//  Created by David Fekke on 1/7/22.
//

import Foundation

struct VCardContact {
    var firstName = ""
    var lastName = ""
    var email = ""
    var phone = ""
    
    func createVCardString() -> String {
        
        let vcard = """
BEGIN:VCARD
VERSION:2.1
FN:\(firstName) \(lastName)
"N:\(lastName);\(firstName)
TEL;CELL:+91 \(phone)
EMAIL;WORK;INTERNET:\(email)
URL:www.swyftmobile.com
ORG:xxx Private limited
END:VCARD
"""
        
        return vcard
    }
}
