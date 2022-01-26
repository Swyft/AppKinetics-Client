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
    
    let path = Bundle.main.resourcePath!
    let samplefilename = "PSI-Training-Signup-Instructions.docx"
    let fileManager = FileManager.default

    func importContact(vcard: String) -> Bool {
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
        
        var paths = getDocumentsDirectory()
        //create filename
        let filename = ProcessInfo().globallyUniqueString.appending(".vcf")
        paths.appendPathComponent(filename)
        let filepathStr = paths.absoluteString
        
        GDFileManager.default().createFile(atPath: filepathStr, contents: vcard.data(using: .utf8), attributes: nil)
        
        do {
            try GDServiceClient.send(to: serviceProviderAddress,
                                                  withService: kImportContact,
                                                  withVersion: kImportContactVersion,
                                                  withMethod: strConstants.kImportMethod,
                                                  withParams: nil,
                                                  withAttachments: [filepathStr],
                                                  bringServiceToFront: .GDEPreferPeerInForeground,
                                                  requestID: &requestId)
            
            boolResult = true
            
        } catch (let error) {
            print("\(error.localizedDescription)")
        }
        return boolResult
    }
    
    func importDocument(filename: String, mimetype: String) -> Bool {
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
        
        let wordfile = moveFileToDynamics(filename: filename)
        let params = ["Filename": filename, "Mimetype": mimetype]
        
        do {
            try GDServiceClient.send(to: serviceProviderAddress,
                                                  withService: kImportDocument,
                                                  withVersion: kImportDocumentVersion,
                                                  withMethod: strConstants.kImportMethod,
                                                  withParams: params,
                                                  withAttachments: [wordfile],
                                                  bringServiceToFront: .GDEPreferPeerInForeground,
                                                  requestID: &requestId)
            
            boolResult = true
            
        } catch (let error) {
            print("\(error.localizedDescription)")
        }
        return boolResult
    }
    
    func importNote(title: String, body: String) -> Bool {
        let kImportNote = strConstants.kImportNote
        let kImportNoteVersion = "1.0.0.0"
        var requestId: NSString? = nil
        
        var boolResult = false
        // com.swyftmobile.smsf.create-note
        let results = GDiOS.sharedInstance().getServiceProviders(for: kImportNote,
                                                                  andVersion: kImportNoteVersion,
                                                                  andServiceType: .application)
        
        guard let serviceProvider = results.first else {
            return false
        }

        guard let serviceProviderAddress = serviceProvider.address else {
            return false
        }
        
        let base64body = Data(body.utf8).base64EncodedString()
        
        let params = ["Title": title, "Body": base64body]
        
        var paths = getDocumentsDirectory()
        //create filename
        let filename = ProcessInfo().globallyUniqueString.appending(".txt")
        paths.appendPathComponent(filename)
        let filepathStr = paths.absoluteString
        
        GDFileManager.default().createFile(atPath: filepathStr, contents: body.data(using: .utf8), attributes: nil)
        
        do {
            try GDServiceClient.send(to: serviceProviderAddress,
                                                  withService: kImportNote,
                                                  withVersion: kImportNoteVersion,
                                                  withMethod: strConstants.kImportMethod,
                                                  withParams: params,
                                                  withAttachments: [filepathStr],
                                                  bringServiceToFront: .GDEPreferPeerInForeground,
                                                  requestID: &requestId)
            
            boolResult = true
            
        } catch (let error) {
            print("\(error.localizedDescription)")
        }
        return boolResult
    }
    
    func saveEditedFileService(from doc: String) -> Bool {
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
        
        var paths = getDocumentsDirectory()
        //create filename
        let filename = ProcessInfo().globallyUniqueString.appending(".vcf")
        paths.appendPathComponent(filename)
        let filepathStr = paths.absoluteString
        
        GDFileManager.default().createFile(atPath: filepathStr, contents: doc.data(using: .utf8), attributes: nil)
        
        do {
            try GDServiceClient.send(to: serviceProviderAddress,
                                                  withService: kSaveEditedFileService,
                                                  withVersion: kSaveEditedFileServiceVersion,
                                                  withMethod: strConstants.kSaveEditMethod,
                                                  withParams: nil,
                                                  withAttachments: [filepathStr],
                                                  bringServiceToFront: .GDEPreferPeerInForeground,
                                                  requestID: &requestId)
            
            boolResult = true
            
        } catch (let error) {
            print("\(error.localizedDescription)")
        }
        return boolResult
    }
    
    private func getDocumentsDirectory() -> URL {
        let searchPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if searchPaths.count > 0 {
            print("\(searchPaths[0])")
        }
        var documentPaths: [String] = Array<String>()
        for url in searchPaths {
            documentPaths.append(url)
        }
        
        var documentPath = URL(fileURLWithPath: documentPaths[0], isDirectory: true)
        documentPath.deleteLastPathComponent()
        return documentPath
    }
    
    // This method takes a file, moves it to dynamics so it can be sent to
    private func moveFileToDynamics(filename: String) -> String {
        print("local file path: \(path)/\(filename)")
        let data = fileManager.contents(atPath: "\(path)/\(filename)")
        let directory = getDocumentsDirectory()
        let dynamicsfilepath = "\(directory)\(filename)"
        GDFileManager.default().createFile(atPath: dynamicsfilepath, contents: data, attributes: nil)
        return dynamicsfilepath
    }
}
