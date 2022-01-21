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
    var url = ""
    
    func createVCardString() -> String {
        
        let vcard = """
BEGIN:VCARD
VERSION:2.1
FN:\(firstName) \(lastName)
N:\(lastName);\(firstName);;;
TEL;WORK;VOICE;PREF:\(phone)
TEL;CELL:\(cell)
EMAIL;WORK;INTERNET:\(email)
URL:\(url)
ORG:Swyft Technology L.L.C.
END:VCARD
"""
        
        return vcard
    }
}
