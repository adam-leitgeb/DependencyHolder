//
//  ServiceHolderFactory.swift
//  Approver
//
//  Created by Adam Leitgeb on 21.05.2021.
//  Copyright © 2021 Avast. All rights reserved.
//

import Foundation

public protocol DependencyHolderFactory {
    func create() -> DependencyHolder
}
