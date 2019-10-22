//
//  ViewController.swift
//  Tilak_MySmitch
//
//  Created by Tilakkumar Gondi on 23/10/19.
//  Copyright © 2019 Tilakkumar Gondi. All rights reserved.
//

import UIKit
import Network

class ViewController: UIViewController,NetServiceDelegate,NetServiceBrowserDelegate {

    let serviceType = "_http._tcp"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .green
    }

    @IBAction func publishAction(_ sender: Any) {
        
        
        let servicePub = NetService.init(domain: "", type: serviceType, name: "Tilak_Phone7")
        servicePub.delegate = self
        servicePub.includesPeerToPeer = true
        servicePub.publish(options: .listenForConnections)
        servicePub.resolve(withTimeout: 3)
        
    }
    
    @IBAction func scanAction(_ sender: Any) {
        let serviceScn = NetServiceBrowser.init()
        serviceScn.delegate = self
        serviceScn.searchForServices(ofType: self.serviceType, inDomain: "")
      
        RunLoop.current.run()
    }
    
    func netServiceDidPublish(_ sender: NetService) {
        print(sender.port)
        print(sender.domain)
        print(sender.addresses!)
        print(sender.name)
        sender.includesPeerToPeer = true
       
    }
    
    func netServiceDidStop(_ sender: NetService) {
        
    }
    
    func netService(_ sender: NetService, didNotPublish errorDict: [String : NSNumber]) {
        
    }
    
    
    
    func netServiceBrowser(_ browser: NetServiceBrowser, didFind service: NetService, moreComing: Bool) {
        print(service)
//        let ipAdd = service.
    }
    
    func netServiceBrowser(_ browser: NetServiceBrowser, didRemoveDomain domainString: String, moreComing: Bool) {
        
    }
    
    func netServiceBrowser(_ browser: NetServiceBrowser, didFindDomain domainString: String, moreComing: Bool) {
        print(domainString)
    }
    
    func netServiceBrowser(_ browser: NetServiceBrowser, didNotSearch errorDict: [String : NSNumber]) {
        print(errorDict)
    }
    
    func netServiceBrowserDidStopSearch(_ browser: NetServiceBrowser) {
        
    }
    
    func netServiceWillResolve(_ sender: NetService) {
        sender.resolve(withTimeout: 3)
    }
    
    func netServiceDidResolveAddress(_ sender: NetService) {
        print(sender.addresses as Any)
    }
}

