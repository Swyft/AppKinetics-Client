# SMSF AppKinetics Client

Based on the BlackBerry Dynamics Sample App for iOS - Swift

This application is meant to be an example of how BlackBerry Dynamics app developers can make App Kenetics based calls into Swyft Mobile for Salesforce. 

The four service calls into Swyft Mobile for Salesforce are as follows;

* Service "com.swyftmobile.smsf.create-contact" with method "importFile"
* Service "com.swyftmobile.smsf.create-document" with method "importFile"
* Service "com.swyftmobile.smsf.create-note" with method "importFile"
* Service "com.good.gdservice.save-edited-file" with method "saveEdit"

Each service call into App Kinetics wdoes require an attachment to be passed.

```swift
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
print("Service call to App Kinetics completed: \(boolResult)")
```

## Requirements

* Xcode 12 or later


## Applies to

iOS 14 SDK or later


## Runtime

iOS 14 or later


## Author(s)

* [David Fekke](https://github.com/davidfekke)


## License

Apache 2.0 License


## Disclaimer

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
