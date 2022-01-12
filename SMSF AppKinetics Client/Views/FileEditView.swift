//
//  FileEditView.swift
//  SMSF AppKinetics Client
//
//  Created by David Fekke on 1/7/22.
//

import SwiftUI

struct FileEditView: View {
    @State var document = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
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
