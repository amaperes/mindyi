//
//  Array+Only.swift
//  Mindji
//
//  Created by Antonela Madalina on 01/10/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
