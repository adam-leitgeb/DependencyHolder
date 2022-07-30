//
//  ServiceHolder.swift
//  FymoCore
//
//  Created by Adam Leitgeb on 21.05.2021.
//

import Foundation

public class DependencyHolder {
    
    // MARK: - Properties

    private var dependencyDictionary: [String: Dependency] = [:]
    
    // MARK: - Object Lifecycle

    public init() {
    }

    // MARK: - Read
    
    public func get<T>(by type: T.Type = T.self) -> T {
        get(by: String(reflecting: type))
    }
    
    public func get<T>(by name: String) -> T {
        guard let service = dependencyDictionary[name] as? T else {
            fatalError("firstly you have to add the service: \(name)")
        }
        return service
    }
    
    // MARK: - Write
    
    public func add<T>(_ type: T.Type, with name: String? = nil, constructor: () -> Dependency) {
        add(type, for: constructor(), with: name)
    }
    
    private func add<T>(_ protocolType: T.Type, for instance: Dependency, with name: String? = nil) {
        let name = name ?? String(reflecting: protocolType)
        dependencyDictionary[name] = instance
    }
    
    // MARK: - Utilities

    public func add<T>(_ type: T.Type, with name: String? = nil, constructor: @autoclosure () -> Dependency) {
        add(type, for: constructor(), with: name)
    }
}
