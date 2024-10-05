//
//  ValueObserver.swift
//  TRPDataLayer
//
//  Created by Evren Yaşar on 20.07.2020.
//  Copyright © 2020 Tripian Inc. All rights reserved.
//

import Foundation
public class ValueObserver<T> {
    public typealias ObserverBlock = (T) -> Void
    public var observers : [UInt: ObserverBlock] = [:]
    
    public var value: T? {
        didSet {
            if value != nil {
                notifyAll(value!)
            }
        }
    }
    
    public init(_ value : T?) {
        self.value = value;
    }
    
    public func addObserver(_ object: AnyObject,  getDefaultValues: Bool = true, observer: @escaping ObserverBlock)  {
        let objectId = objectUniqueId(obj: object)
        observers[objectId] = observer
        if getDefaultValues && value != nil {
            observer(value!);
        }
    }
    
    public func notifyAll(_ change: T) {
        for observer in observers.values {
            observer(change)
        }
    }
    
    public func removeObservers() {
        observers.removeAll()
    }
    
    public func removeObserver(_ object: AnyObject) {
        let objectId = objectUniqueId(obj: object)
        observers.removeValue(forKey: objectId)
    }
    
    func objectUniqueId(obj: AnyObject) -> UInt {
        return UInt(bitPattern: ObjectIdentifier(obj))
    }
    
    deinit {
        print("ValueObserver Deinit")
    }
}
