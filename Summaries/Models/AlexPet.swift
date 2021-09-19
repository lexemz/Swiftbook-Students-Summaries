//
//  AlexPet.swift
//  Summaries
//
//  Created by Arcani on 18.09.2021.
//
class Pet {
    var name: String
    var petsIndex: String
    init(name: String, index: String) {
        self.name = name
        petsIndex = index
    }
}

class Cat: Pet {
    
    let favActivities: String

    init(name: String, activities: String, index: String) {
        favActivities = activities
        super.init(name: name, index: index)
    }
    
    static func getCat() -> Cat {
        let counter = Int.random(in: 0...4)
        let index = "Cat\(counter)"
        let cat = Cat(
            name: Cats.shared.names[counter],
            activities: Cats.shared.favActivities[counter],
            index: index
        )
        return cat
    }
}

class Dog: Pet {
        
    let favActivities: String
   
    init(name: String, activities: String, index: String) {
        favActivities = activities
        super.init(name: name, index: index)
    }
    
    static func getDog() -> Dog {
        let counter = Int.random(in: 0...4)
        let index = "Dog\(counter)"
        let dog = Dog(
            name: Dogs.shared.names[counter],
            activities: Dogs.shared.favActivities[counter],
            index: index
        )
        return dog
    }
}

enum DistributionOfPetTypes: Int {
    case evenDistribution = 2
    case onePetType = 4
}

