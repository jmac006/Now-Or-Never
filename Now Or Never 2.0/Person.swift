//
//  Person.swift
//  Now Or Never
//
//  Created by Justin Mac on 5/4/16.
//  Copyright © 2016 Justin Mac. All rights reserved.
//

import UIKit

class Person {
    
    var name = String()
    var bio = String()
    var id = Int() //unique identifier for every person
    var age = Int()
    var crushes = [Person]() //stores who the person likes in this array
    var matches = [Person]() //stores the matches the person has
    
    init() {
        name = "No name"
        id = -1;
        age = 100
        bio = "Empty Bio"
    }
    
    init(name: String, id: Int, age : Int, bio : String) {
        self.name = name
        self.age = age
        self.bio = bio
    }
    
    func addCrush(p : Person) -> Void {
        crushes.append(p)
    }
    
    
    func checkLikes(p : Person) -> Bool { //checks if the person liked them or not
        for crush in crushes {
            if(crush == p) {
                return true
            }
        }
        return false
    }
    
}

func ==(left : Person, right : Person) -> Bool { //overrides the equality operator
    if (left.name == right.name && left.id == right.id) {
        return true
    }
    return false
}
