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
    var cell = ""
    
    func createVCardString() -> String {
        
        let vcard = """
BEGIN:VCARD
VERSION:2.1
FN:\(firstName) \(lastName)
N:\(lastName);\(firstName);;;
TEL;WORK;VOICE;PREF:+91 \(phone)
TEL;CELL:+91 \(cell)
EMAIL;WORK;INTERNET:\(email)
URL:www.swyftmobile.com
ORG:Swyft Technology L.L.C.
END:VCARD
"""
        
        return vcard
    }
}
