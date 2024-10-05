//
//  Array+Extensions.swift
//  TRPDataLayer
//
//  Created by Evren Yaşar on 27.08.2020.
//  Copyright © 2020 Tripian Inc. All rights reserved.
//

import Foundation
extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
