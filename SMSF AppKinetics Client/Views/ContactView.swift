//
//  ContactView.swift
//  SMSF AppKinetics Client
//
//  Created by David Fekke on 1/7/22.
//

import SwiftUI

struct ContactView: View {
    @State var firstName = "David"
    @State var lastName = "Fekke"
    @State var email = "david.fekke@sample.com"
    @State var officephone = "904-567-7694"
    @State var cellphone = "904-899-2986"
    
    var body: some View {
        Form {
            Section(header: Text("Contact ")) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                TextField("Office Phone", text: $officephone)
                TextField("Cell Phone", text: $cellphone)
            }
            Section {
                Button("Send to SMSF") {
                    print("send to SMSF")
                    let vcard = VCardContact(firstName: firstName, lastName: lastName, email: email, phone: officephone, cell: cellphone)
                    let vcardstr = vcard.createVCardString()
                    let _ = AppKineticsController().importContact(vcard: vcardstr)
                }
            }
            
        }
        .navigationTitle("Create Contact")
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
