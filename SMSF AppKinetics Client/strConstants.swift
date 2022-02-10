//
//  Constants.swift
//  Dynamics SwiftUI Sample
//
//  Created by David Fekke on 1/7/22.
//

import Foundation

/*
 Import Contact (com.swyftmobile.smsf.create-contact)
  o This service allows BlackBerry Dynamics apps to import a contact in VCF format into Salesforce as either a Contact record or a Lead record with Swyft Mobile for Salesforce app.
  • Import Document (com.swyftmobile.smsf.create-document)
  o This service allows BlackBerry Dynamics apps to import documents or Files into Salesforce and the Salesforce file system with Swyft Mobile for Salesforce app.

  • Import Note (com.swyftmobile.smsf.create-note)
  o This service allows BlackBerry Dynamics apps to import notes into Salesforce as Note records using Swyft Mobile for Salesforce.
  • Save Edited File Service (com.good.gdservice.save-edited-file)
  o This service is for returning a file from an editor application. The file would have originated in the application that is the provider of the service, and would have been sent to the editor application by means of the Edit File Service
 
 */

public struct strConstants {
    static let kImportContact          = "com.swyftmobile.smsf.create-contact"
    static let kImportDocument         = "com.swyftmobile.smsf.create-document"
    static let kImportNote             = "com.swyftmobile.smsf.create-note"
    static let kSaveEditedFileService  = "com.good.gdservice.save-edited-file"
    
    static let kSaveEditMethod         = "saveEdit"; // method for saving edited file in client app
    static let kEditFileMethod         = "editFile"; // method for editing file in service app
    static let kImportMethod           = "importFile";
}
