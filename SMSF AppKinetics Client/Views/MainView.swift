/* Copyright (c) 2021 BlackBerry Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import SwiftUI
import BlackBerryDynamics.Runtime

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct MultilineTextView : UIViewRepresentable {
    @Binding var text : String

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.dataDetectorTypes = .link
        textView.textContainerInset = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textView.textContainer.lineFragmentPadding = 0
        
        // add border
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.cornerRadius = 5.0
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

struct EditableMultiLineTextView : UIViewRepresentable {
    @Binding var text : String

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = true
        textView.isScrollEnabled = false
        textView.dataDetectorTypes = .link
        textView.textContainerInset = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textView.textContainer.lineFragmentPadding = 0
        
        // add border
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.cornerRadius = 5.0
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

struct PaddedCustomTextfield : View {
    @State var placeHolder : String
    @Binding var text : String
    
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            TextField(placeHolder, text: $text)
                .lineLimit(1)
                .padding(EdgeInsets(top: 0.0, leading: 5.0, bottom: 0.0, trailing: 5.0))
        }).border(Color.black, width: 1)
    }
}

struct MainView: View {
    
    let appVersionString: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    let appBuildVersion: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NavigationLink("Create Contact") {
                        ContactView()
                    }
                    Spacer()
                    NavigationLink("Create Lead") {
                        LeadView()
                    }
                    Spacer()
                    NavigationLink("Create Document to Upload Document") {
                        DocumentView()
                    }
                    Spacer()
                    NavigationLink("Create Note") {
                        NoteView()
                    }
                    Spacer()
                    NavigationLink("Edit File") {
                        FileEditView()
                    }
                    .padding(.bottom, 22.0)
                    Text("Build: \(appVersionString).\(appBuildVersion)").font(.callout)
                }
            }.navigationTitle("AppKinetics Client")
        }
        .font(.headline)
    }
}

// Cannot use preview because GD will not be provisioned in the preview environment which prevents the database from being initilized
//
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//            .environmentObject(FileController())
//            .environmentObject(DBController())
//            .environmentObject(SocketController())
//            .environmentObject(HttpController())
//    }
//}
