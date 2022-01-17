//
//  FileEditView.swift
//  SMSF AppKinetics Client
//
//  Created by David Fekke on 1/7/22.
//

import SwiftUI

struct FileEditView: View {
    @State var document = """
BEGIN:VCARD
VERSION:2.1
FN:Mike Fitzpatrick
N:Fitzpatrick;Mike
TEL;WORK;VOICE;PREF:+91 9045720482
TEL;CELL:+91 2067309623
EMAIL;WORK;INTERNET:mike.fitzpatrick@swyftmobile.com
URL:www.swyftmobile.com
ORG:Swyft Technology L.L.C.
END:VCARD
"""
    
    var body: some View {
        VStack {
            Section(header: Text("Edit Document")) {
                GeometryReader { reader in
                    EditableMultiLineTextView(text: $document)
                        .frame(width: reader.size.width - 32, height: 200.0, alignment: .center)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        .padding()
                }
            }
            Section {
                Button("Send to SMSF") {
                    print("send to SMSF")
                    let _ = AppKineticsController().saveEditedFileService(from: document)
                }
            }
        }.navigationTitle("File Edit")
    }
}

struct FileEditView_Previews: PreviewProvider {
    static var previews: some View {
        FileEditView()
    }
}
