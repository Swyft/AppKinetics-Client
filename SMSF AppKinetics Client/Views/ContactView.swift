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
    @State var phone = "904-567-7694"
    
    var body: some View {
        Form {
            Section(header: Text("Contact ")) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                TextField("Phone", text: $phone)
            }
            Section {
                Button("Send to SMSF") {
                    print("send to SMSF")
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
