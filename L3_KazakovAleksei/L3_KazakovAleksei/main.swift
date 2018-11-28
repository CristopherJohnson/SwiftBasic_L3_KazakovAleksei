//
//  main.swift
//  L3_KazakovAleksei
//
//  Created by Алексей Казаков on 28/11/2018.
//  Copyright © 2018 Алексей Казаков. All rights reserved.
//

import Foundation

//Сразу оговорюсь, я не понимаю, зачем делать 2 структуры, которые будут иметь одинаковый набор свойств, за исключением типа машины: грузовик или легковая. Поэтому я создам одну структуру. Если необходимо обязательно создавать 2 - можно удалить первое перечисление и создать 2 разные структуры

enum CarType {
    case car, truck
}

enum CarBrand {
    case Mercedes
    case BMW
    case Honda
    case Lada
    case Jeep
}

enum TrunkAction {
    case add (volume: Int)
    case remove (volume: Int)
}

enum EngineStatus {
    case on
    case off
}

enum WindowStatus {
    case open
    case closed
}

struct Car {
    let carType: CarType
    let brand: CarBrand
    let yearOfManufactory: Int
    let maxTrunkVolume: Int   // в метрах кубических
    var currentVolume: Int {
        didSet {
            print("Сейчас в багажнике \(currentVolume) м3")
        }
    }
    var engineStatus: EngineStatus
    var windowStatus: WindowStatus {
        willSet {
            if newValue == .open {
                print("Окна открываются")
            } else {
                print("Окна закрываются")
            }
        }
    }
    
    mutating func addToTrunk (addindVolume volume: Int) {
        if volume > maxTrunkVolume {
            print("Столько сюда не поместится :(")
        } else if volume < 0 {
            print("Нельзя положить в багажник то, чего нет")
        } else {
            self.currentVolume += volume
        }
    }
    
    mutating func removeFromTrunk (removingVolume volume: Int) {
        if volume > currentVolume {
            print("Нельзя вытащить из багажника больше, чем в нем есть")
        } else if volume < 0 {
            print("Нельзя вытащить из багажника отрицательное количество вещей")
        } else {
            self.currentVolume -= volume
        }
    }
    
    mutating func openWindows (){
        self.windowStatus = .open
    }
    
    mutating func closeWindow (){
        self.windowStatus = .closed
    }
}

var car1 = Car (carType: .car, brand: .Mercedes, yearOfManufactory: 2017, maxTrunkVolume: 500, currentVolume: 0, engineStatus: .off, windowStatus: .closed)
var truck1 = Car (carType: .truck, brand: .Jeep, yearOfManufactory: 1998, maxTrunkVolume: 9000, currentVolume: 0, engineStatus: .on, windowStatus: .open)

car1.addToTrunk(addindVolume: 600)
car1.addToTrunk(addindVolume: 400)
car1.removeFromTrunk(removingVolume: -5)
car1.removeFromTrunk(removingVolume: 450)
car1.removeFromTrunk(removingVolume: 300)
truck1.addToTrunk(addindVolume: 8000)
car1.openWindows()
truck1.closeWindow()

print(car1)
print(truck1)
