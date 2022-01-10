//
//  NoteView.swift
//  SMSF AppKinetics Client
//
//  Created by David Fekke on 1/7/22.
//

import SwiftUI

struct NoteView: View {
    @State var title = ""
    @State var note = ""
    
    var body: some View {
        Form {
            Section(header: Text("Note ")) {
                TextField("Title", text: $title)
                TextEditor(text: $note)
            }
            Section {
                Button("Send to SMSF") {
                    print("send to SMSF")
                    //let _ = AppKineticsController().importContact(vcard: vcardstr)
                }
            }
        }.navigationTitle("Create Note")
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
