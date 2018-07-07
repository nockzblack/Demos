//
//  Concentration.swift
//  Conectration_Project
//
//  Created by Fernando Benavides Rodriguez on 3/31/18.
//  Copyright © 2018 Fernando Benavides. All rights reserved.
//

import Foundation

class Concentration {
    var gameCards = Array<Card>()
    var indexOfOnlyCardFaceUp: Int?
    var flipCount = 0
    var score = 0

    init(numberOfPairs: Int) {
        for index in 0..<numberOfPairs {
            let newCard = Card(id: index)
            let matchingCard = newCard
            gameCards.append(newCard);
            gameCards.append(matchingCard)
        }

        // Shuffling cards
        for index in 0..<numberOfPairs {
            let randomIndex = Int(arc4random_uniform(UInt32(gameCards.count)))
            let currentCard = gameCards[index]
            gameCards[index] = gameCards[randomIndex]
            gameCards[randomIndex] = currentCard
        }
    }

    func selectCard(index: Int) {
        var isAMatch: Bool
        // Just check for the cards that haven't been matched
        if !gameCards[index].isMatched {

            if indexOfOnlyCardFaceUp == nil {
                flipCount += 1
            }

            // check if there is index of a card already face up and it's different from the current card index
            if let matchedIndex = indexOfOnlyCardFaceUp, index != matchedIndex {
                if gameCards[matchedIndex].id == gameCards[index].id {
                    gameCards[matchedIndex].isMatched = true
                    gameCards[index].isMatched = true
                    isAMatch = true
                } else {
                    isAMatch = false
                }

                setScore(result: isAMatch, for: index, and: matchedIndex)
                // after a match both cards have been at least one time face up
                gameCards[matchedIndex].atLeastOneTimeFaceUp = true
                gameCards[index].atLeastOneTimeFaceUp = true

                gameCards[index].isFaceUp = true
                flipCount += 1
                // after this point there isn't cards up
                indexOfOnlyCardFaceUp = nil
            } else {
                for index in gameCards.indices {
                    gameCards[index].isFaceUp = false
                }
                gameCards[index].isFaceUp = true
                indexOfOnlyCardFaceUp = index
            }
        }

    }

    // Gives 2 point for a match and -1 for a card previously seen involved in the mismatch
    func setScore(result:Bool, for firstIndex:Int, and secondIndex:Int) {
        if result {
            score += 2
        } else {
            if gameCards[firstIndex].atLeastOneTimeFaceUp {
                score -= 1
            }
            if gameCards[secondIndex].atLeastOneTimeFaceUp {
                score -= 1
            }
        }
    }
}
