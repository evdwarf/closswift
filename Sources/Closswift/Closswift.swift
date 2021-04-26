//
//  Closswift.swift
//  Closswift
//
//  Created by evdwarf on 2021/04/26.
//

public protocol ClosswiftCombinable {
    var clossValue: Array<String> { get }
}

extension Optional: ClosswiftCombinable where Wrapped == String {
    public var clossValue: Array<String> {
        self.map({ [$0] }) ?? []
    }
}

extension String: ClosswiftCombinable {
    public var clossValue: Array<String> {
        [self].filter({ !$0.isEmpty })
    }
}

extension Int: ClosswiftCombinable {
    public var clossValue: Array<String> {
        []
    }
}

extension Bool: ClosswiftCombinable {
    public var clossValue: Array<String> {
        []
    }
}

extension Array: ClosswiftCombinable {
    public var clossValue: Array<String> {
        self.compactMap {
            guard let str = ($0 as? String), !str.isEmpty else {
                return nil
            }
            return str
        }
    }
}

extension Dictionary: ClosswiftCombinable where Key == String, Value == Bool {
    public var clossValue: Array<String> {
        reduce(into: Array<String>()) { (sum, dict) in
            guard dict.value else {
                return
            }
            sum.append(dict.key)
        }
    }
}

public func closs(_ parameters: ClosswiftCombinable...) -> String {
    parameters.map { $0.clossValue }.flatMap { $0 }.joined(separator: " ")
}
