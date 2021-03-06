//
//  Batchoutput.swift
//  RsyncOSX
//
//  Created by Thomas Evensen on 12.03.2017.
//  Copyright © 2017 Thomas Evensen. All rights reserved.
//

import Foundation

class OutputBatch {

    var output: [String]?

    func getOutputCount () -> Int {
        return self.output?.count ?? 0
    }

    func getOutput () -> [String]? {
        return self.output
    }

    func addLine (str: String) {
        if self.output == nil {
            self.output = [String]()
        }
        self.output!.append(str)
    }

    init() {
        self.output = [String]()
    }
}
