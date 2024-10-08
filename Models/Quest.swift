//
//  Quest.swift
//  Lab06
//
//  Created by Jesse Mitra on 10/3/24.
//

struct Quest {
    private(set) var description: String
    private(set) var reward: Int
    let questType: QuestType
    var stepsRemaining: Int
    
    init(description: String, questType: QuestType) {
        self.description = description
        self.questType = questType
        self.stepsRemaining = questType.totalSteps
        self.reward = Int(Double(questType.reward) * questType.difficultyMultiplier())
    }
    
    mutating func completeStep() {
        if stepsRemaining > 0 {
            stepsRemaining -= 1
            updateReward()
        }
    }
    
    private mutating func updateReward() {
        let percentComplete = Double(questType.totalSteps - stepsRemaining) / Double(questType.totalSteps)
        reward = Int(Double(questType.reward) * questType.difficultyMultiplier() * percentComplete)
    }
}
