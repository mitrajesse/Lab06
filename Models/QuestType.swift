//
//  QuestType.swift
//  Lab06
//
//  Created by Jesse Mitra on 10/3/24.
//

enum QuestType {
    case journey(location: String)
    case target(enemy: String)
    case explore(location: String)
    case treasure(size: Int)
    
    var difficultyMultiplier: Double {
        switch self {
        case .journey:
            return 1.0
        case .target:
            return 1.1
        case .explore:
            return 0.9
        case .treasure(let size):
            return size < 5 ? 1.0 : 1.2
        }
    }
    
    var totalSteps: Int {
        switch self {
        case .journey(let location):
            return location == "Local" ? 3 : 5
        case .target, .explore, .treasure:
            return 4
        }
    }
    
    var reward: Int {
        switch self {
        case .journey, .target, .explore:
            return 100
        case .treasure(let size):
            if size >= 0 && size <= 5 {
                return 50
            } else if size <= 10 {
                return 100
            } else if size <= 15 {
                return 150
            } else {
                return 0
            }
        }
    }
}
