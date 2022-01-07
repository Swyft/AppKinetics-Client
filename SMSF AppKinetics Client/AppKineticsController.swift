//
//  AppKineticsController.swift
//  SMSF AppKinetics Client
//
//  Created by David Fekke on 1/7/22.
//

import Foundation
import BlackBerryDynamics.Runtime
import BlackBerryDynamics.AppKinetics
import GD.Runtime

class AppKineticsController {
    
    // Create AppKinetics Controller methods
    /*
     let kImportContact          = "com.swyftmobile.smsf.create-contact"
     let kImportDocument         = "com.swyftmobile.smsf.create-document"
     let kImportNote             = "com.swyftmobile.smsf.create-note"
     let kSaveEditedFileService
     */

    func importContact() -> Bool {
        let kImportContact = strConstants.kImportContact
        let kImportContactVersion = "1.0.0.0"
 
        
        var requestId: NSString? = nil
        //NSError * error=nil;
        
        let results = GDiOS.sharedInstance().getServiceProviders(for: kImportContact,
                                                                  andVersion: kImportContactVersion,
                                                                  andServiceType: .application)
                
        var boolResult = false
        
        let serviceProvider = results.first

        do {
            try GDServiceClient.send(to: (serviceProvider?.address)!,
                                                  withService: kImportContact,
                                                  withVersion: kImportContactVersion,
                                                  withMethod: strConstants.kImportMethod,
                                                  withParams: nil,
                                                  withAttachments: nil,
                                                  bringServiceToFront: .GDEPreferPeerInForeground,
                                                  requestID: &requestId)
            
            boolResult = true
            
            
        } catch (let error) {
            print("\(error.localizedDescription)")
        }
        return boolResult
    }
    
    func importDocument() {
        
    }
    
    func importNote() {
        
    }
    
    func saveEditedFileService() {
        
    }
    
}
