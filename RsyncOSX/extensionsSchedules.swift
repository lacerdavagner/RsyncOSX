//
//  extensionsSchedules.swift
//  RsyncOSX
//
//  Created by Thomas Evensen on 25.08.2018.
//  Copyright © 2018 Thomas Evensen. All rights reserved.
//

import Foundation
import Cocoa

protocol SetSchedules {
    var schedulesDelegate: GetSchedulesObject? {get}
    var schedules: Schedules? {get}
}

extension SetSchedules {
    weak var schedulesDelegate: GetSchedulesObject? {
        return ViewControllerReference.shared.getvcref(viewcontroller: .vctabmain) as? ViewControllertabMain
    }
    var schedules: Schedules? {
        return self.schedulesDelegate?.getschedulesobject()
    }
}

// Protocol for returning object configurations data
protocol GetSchedulesObject: class {
    func getschedulesobject() -> Schedules?
    func createschedulesobject(profile: String?) -> Schedules?
    func reloadschedulesobject()
}

enum Scheduletype {
    case once
    case daily
    case weekly
}
