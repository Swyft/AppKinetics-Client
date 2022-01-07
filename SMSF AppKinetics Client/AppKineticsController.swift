//
//  AppKineticsController.swift
//  SMSF AppKinetics Client
//
//  Created by David Fekke on 1/7/22.
//

import Foundation
import BlackBerryDynamics.Runtime
import BlackBerryDynamics.AppKinetics

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
        
        var boolResult = false
        
        let results = GDiOS.sharedInstance().getServiceProviders(for: kImportContact,
                                                                  andVersion: kImportContactVersion,
                                                                  andServiceType: .application)
                
        guard let serviceProvider = results.first else {
            return false
        }

        guard let serviceProviderAddress = serviceProvider.address else {
            return false
        }
        
        do {
            try GDServiceClient.send(to: serviceProviderAddress,
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
    
    func importDocument() -> Bool {
        let kImportDocument = strConstants.kImportDocument
        let kImportDocumentVersion = "1.0.0.0"
        var requestId: NSString? = nil
        
        var boolResult = false
        
        let results = GDiOS.sharedInstance().getServiceProviders(for: kImportDocument,
                                                                  andVersion: kImportDocumentVersion,
                                                                  andServiceType: .application)
        
        guard let serviceProvider = results.first else {
            return false
        }

        guard let serviceProviderAddress = serviceProvider.address else {
            return false
        }
        
        do {
            try GDServiceClient.send(to: serviceProviderAddress,
                                                  withService: kImportDocument,
                                                  withVersion: kImportDocumentVersion,
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
    
    func importNote() -> Bool {
        let kImportNote = strConstants.kImportNote
        let kImportNoteVersion = "1.0.0.0"
        var requestId: NSString? = nil
        
        var boolResult = false
        
        let results = GDiOS.sharedInstance().getServiceProviders(for: kImportNote,
                                                                  andVersion: kImportNoteVersion,
                                                                  andServiceType: .application)
        
        guard let serviceProvider = results.first else {
            return false
        }

        guard let serviceProviderAddress = serviceProvider.address else {
            return false
        }
        
        do {
            try GDServiceClient.send(to: serviceProviderAddress,
                                                  withService: kImportNote,
                                                  withVersion: kImportNoteVersion,
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
    
    func saveEditedFileService() -> Bool {
        let kSaveEditedFileService = strConstants.kSaveEditedFileService
        let kSaveEditedFileServiceVersion = "1.0.0.0"
        var requestId: NSString? = nil
        
        var boolResult = false
        
        let results = GDiOS.sharedInstance().getServiceProviders(for: kSaveEditedFileService,
                                                                  andVersion: kSaveEditedFileServiceVersion,
                                                                  andServiceType: .application)
        
        guard let serviceProvider = results.first else {
            return false
        }

        guard let serviceProviderAddress = serviceProvider.address else {
            return false
        }
        
        do {
            try GDServiceClient.send(to: serviceProviderAddress,
                                                  withService: kSaveEditedFileService,
                                                  withVersion: kSaveEditedFileServiceVersion,
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
    
}
