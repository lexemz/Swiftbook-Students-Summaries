//
//  AlexPet.swift
//  Summaries
//
//  Created by Arcani on 18.09.2021.
//
class Pet {}

class Cat: Pet {
    let name: String
    let favActivities: String
    let catsIndex: String
    
    init(name: String, activities: String, index: String) {
        self.name = name
        favActivities = activities
        catsIndex = index
    }
    
    static func getCat() -> Cat {
        var counter = 0
        let index = "Cat\(counter)"
        let cat = Cat(
            name: Cats.shared.names[counter],
            activities: Cats.shared.favActivities[counter],
            index: index)
        counter += 1
        return cat
    }
}

class Dog: Pet {
    let name: String
    let favActivities: String
    let dogsIndex: String
    
    init(name: String, activities: String, index: String) {
        self.name = name
        favActivities = activities
        dogsIndex = index
    }
    
    static func getDog() -> Dog {
        var counter = 0
        let index = "Dog\(counter)"
        let dog = Dog(
            name: Dogs.shared.names[counter],
            activities: Dogs.shared.favActivities[counter],
            index: index)
        counter += 1
        return dog
    }
}

enum DistributionOfPetTypes: Int {
    case evenDistribution = 2
    case onePetType = 4
}

