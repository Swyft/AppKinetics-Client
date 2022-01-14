//
//  DocumentView.swift
//  SMSF AppKinetics Client
//
//  Created by David Fekke on 1/7/22.
//

import SwiftUI

struct DocumentView: View {
    
    var fileArray = ["Airplane Usage Log.doc",
                     "PSI-Training-Signup-Instructions.docx",
                     "radio alt and 5g.pdf"]
    
    var fileDictionaryArray: [String: String] = ["Airplane Usage Log.doc": "application/msword",
                               "PSI-Training-Signup-Instructions.docx": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                               "radio alt and 5g.pdf": "application/pdf"]
    
    @State var selectedIndex = 0
    
    var body: some View {
        Form {
            Section(header: Text("Document")) {
                Text("Select your document to import")
                
                Picker("Document", selection: $selectedIndex) {
                    Text("Airplane Usage Log.doc").tag(0)
                    Text("PSI-Training-Signup-Instructions.docx").tag(1)
                    Text("radio alt and 5g.pdf").tag(2)
                }
                
            }
            Section {
                Button("Send to SMSF") {
                    print("send Doc to SMSF")
                    let filename = fileArray[selectedIndex]
                    if let mimetype = fileDictionaryArray[filename] {
                        let _ = AppKineticsController().importDocument(filename: filename, mimetype: mimetype)
                    }
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
