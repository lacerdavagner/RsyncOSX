//
//  profiles.swift
//  RsyncOSX
//
//  Created by Thomas Evensen on 17/10/2016.
//  Copyright © 2016 Thomas Evensen. All rights reserved.
//

import Foundation

// Protocol for reporting file errors
protocol FileError: class {
    func fileerror(errorstr:String)
}

class profiles: files {
    
    // Delegate for reporting file error if any to main view
    weak var error_delegate: FileError?
    
    // Function for creating new profile directory
    func createProfile(profileName:String) {
        let fileManager = FileManager.default
        if let path = self.fileRoot {
            let profileDirectory = path + "/" + profileName
            if (fileManager.fileExists(atPath: profileDirectory) == false) {
                do {
                    try fileManager.createDirectory(atPath: profileDirectory, withIntermediateDirectories: true, attributes: nil)}
                catch let e {
                    let error = e as NSError
                    self.error(errorstr: error.description)
                }
            }
        }
    }
    
    // Function for deleting profile
    // if let path = URL.init(string: profileDirectory) {
    func deleteProfile(profileName:String) {
        let fileManager = FileManager.default
        if let path = self.fileRoot {
            let profileDirectory = path + "/" + profileName
            if (fileManager.fileExists(atPath: profileDirectory) == true) {
                let answer = Alerts.dialogOKCancel("Delete profile: " + profileName + "?", text: "Cancel or OK")
                if (answer){
                    do {
                        try fileManager.removeItem(atPath: profileDirectory)}
                    catch let e {
                        let error = e as NSError
                        self.error(errorstr: error.description)
                    }
                }
            }
        }
    }
     
    // Private func for propagating any file error to main view
    private func error(errorstr:String) {
        if let pvc = SharingManagerConfiguration.sharedInstance.ViewControllertabMain {
            self.error_delegate = pvc as? ViewControllertabMain
            self.error_delegate?.fileerror(errorstr: errorstr)
        }
    }
    
    init (path:String?) {
        super.init(path: path, root: .profileRoot)
    }
    
}
