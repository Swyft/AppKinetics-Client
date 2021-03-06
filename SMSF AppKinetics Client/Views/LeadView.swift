//
//  LeadView.swift
//  SMSF AppKinetics Client
//
//  Created by David Fekke on 1/24/22.
//

import SwiftUI

struct LeadView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var company = ""
    @State var officephone = ""
    @State var cellphone = ""
    @State var url = ""
    @State var showingAlert = false
    @State var validationMessage = ""
    
    var body: some View {
        Form {
            Section(header: Text("Lead ")) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                TextField("Company Name", text: $company)
                TextField("Office Phone", text: $officephone)
                    .keyboardType(.phonePad)
                TextField("Cell Phone", text: $cellphone)
                    .keyboardType(.phonePad)
                TextField("Website URL", text: $url)
                    .keyboardType(.URL)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            Section {
                if #available(iOS 15.0, *) {
                    Button("Send to SMSF") {
                        print("send to SMSF")
                        let (message, isValid) = validateForm()
                        validationMessage = message
                        if isValid {
                            let vcard = VCardContact(firstName: firstName, lastName: lastName,   organization: company, email: email, phone: officephone, cell: cellphone, url: url)
                            let vcardstr = vcard.createVCardString()
                            let _ = AppKineticsController().importContact(vcard: vcardstr)
                        } else {
                            print(message)
                            showingAlert = true
                        }
                        
                    }.alert("Important message \(validationMessage)", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                } else {
                    Button("Send to SMSF") {
                        print("send to SMSF")
                        let (message, isValid) = validateForm()
                        validationMessage = message
                        if isValid {
                            let vcard = VCardContact(firstName: firstName, lastName: lastName, organization: company, email: email, phone: officephone, cell: cellphone, url: url)
                            let vcardstr = vcard.createVCardString()
                            let _ = AppKineticsController().importContact(vcard: vcardstr)
                        } else {
                            print(message)
                        }
                    }
                }
            }
            
        }
        .navigationTitle("Create Lead")
    }
    
    func validateForm() -> (String, Bool) {
        var isValid = true
        var message = ""
        if firstName.isEmpty {
            message = "\(message) First Name field must be filled out"
            isValid = false
        }
        if lastName.isEmpty {
            message = "\(message) Last Name field must be filled out"
            isValid = false
        }
        if email.isEmpty {
            message = "\(message) Email field must be filled out"
            isValid = false
        }
//        if officephone.isEmpty {
//            message = "\(message) Office field must be filled out"
//            isValid = false
//        }
//        if cellphone.isEmpty {
//            message = "\(message) Cell phone field must be filled out"
//            isValid = false
//        }
        return (message, isValid)
    }
}

struct LeadView_Previews: PreviewProvider {
    static var previews: some View {
        LeadView()
    }
}
