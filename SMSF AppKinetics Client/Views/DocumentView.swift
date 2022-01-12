//
//  DocumentView.swift
//  SMSF AppKinetics Client
//
//  Created by David Fekke on 1/7/22.
//

import SwiftUI

struct DocumentView: View {
    var body: some View {
        // PSI-Training-Signup-Instructions.docx
        Form {
            Section(header: Text("Document")) {
                Text("PSI-Training-Signup-Instructions.docx")
                
            }
            Section {
                Button("Send to SMSF") {
                    print("send Doc to SMSF")
                    let _ = AppKineticsController().importDocument(filename: "PSI-Training-Signup-Instructions.docx", mimetype: "application/vnd.openxmlformats-officedocument.wordprocessingml.document")
                }
            }
        }.navigationTitle("Create Document")
    }
}

struct DocumentView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentView()
    }
}
