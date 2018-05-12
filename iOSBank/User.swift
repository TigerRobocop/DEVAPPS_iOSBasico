//
//  User.swift
//  iOSBank
//
//  Created by Liv Souza on 12/05/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import Foundation

class User
{
    //var id: Int
    var userName: String
    var balance: Float
    var limit: Float
    
    init(userName: String) {
        self.userName = userName
        self.balance = 2000
        self.limit = 5000
    }
    
    
    func getBalance() -> Float { return self.balance }
    func getUserName() -> String { return self.userName }
    
    func deposit(amount: Float) -> Float { return amount }
    func withdrawal(amount: Float) -> Float { return amount }
    
    var listOfStrings = ["Rainbow", "Banana", "Social"]
    
    private static var singleton: User?
    
    static var instance: User {
        get {
            if singleton == nil {
                singleton = User(userName: userName)
            }
            return singleton!
        }
    }
    
    func size() -> Int {
        return listOfStrings.count
    }
    
    func insert(value: String) {
        listOfStrings.append(value)
    }
    
    func remove(at index: Int) -> String {
        return listOfStrings.remove(at: index)
    }
    
    func get (at index: Int) -> String {
        return listOfStrings[index]
    }
}
