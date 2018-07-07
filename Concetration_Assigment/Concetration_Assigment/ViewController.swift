//
//  ViewController.swift
//  Conectration_Project
//
//  Created by Fernando Benavides Rodriguez on 3/31/18.
//  Copyright © 2018 Fernando Benavides. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        selectRandomTheme()
    }

    // the cominication between controller and model
    // we add 1 card and div between 2 in order to always have a even number
    lazy var game = Concentration(numberOfPairs: (cardsButtons.count + 1) / 2)


    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardsButtons: [UIButton]!
    @IBOutlet weak var ScoreLabel: UILabel!


    @IBAction func newGame(_ sender: UIButton) {
        game = Concentration(numberOfPairs: (cardsButtons.count + 1) / 2)
        emoji = Dictionary<Int,String>()
        selectRandomTheme()
        updateViewFromModel()
    }


    @IBAction func touchCard(_ sender: UIButton) {
        if let choosedCard = cardsButtons.index(of: sender) {
            game.selectCard(index: choosedCard)
            updateViewFromModel()
        }
    }

    func updateViewFromModel() {
        for index in cardsButtons.indices {
            let button = cardsButtons[index]
            let card = game.gameCards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: UIControlState.normal)
                if card.isMatched {
                    button.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 0)
                } else {
                    button.backgroundColor = #colorLiteral(red: 0, green: 0.5453827374, blue: 0.9300047589, alpha: 1)
                }
            }
        }
        flipCountLabel.text = "Flips: \(game.flipCount)"
        ScoreLabel.text = "Score: \(game.score)"
    }



    var emojiChoice = Array<String>()

    var setOfThemes = [["🐏","🏛","🥗","🔵","📱","🏈","🎾","🏟","📚","🎓"],["👮🏽‍♂️","🕵🏽‍♂️","👷🏽‍♂️","👩🏽‍🏫","👩🏽‍🎤","👩🏽‍🔧","👨🏽‍🔬","👩🏽‍✈️","🤴🏽","👩🏽‍⚖️"],["☺️","😜","😣","🤯","😈","😎","😂","😏","😉","😰"],["🚙","🚲","🏍","🚝","✈️","🚁","🚢","🚎","🚞","🚂"],["🍎","🥑","🥗","🍕","🌮","🍫","🥡","🍷","☕️","🌽"],["☃️","🐵","🙌🏽","💩","👻","🎮","🃏","🇲🇽","🎲","🎾"]]

    func addNewTheme(as emoji:[String]) {
        setOfThemes.append(emoji)
    }

    func selectRandomTheme() {
        let randomIndex = Int(arc4random_uniform(UInt32(setOfThemes.count)))
        emojiChoice = setOfThemes[randomIndex]
    }



    var emoji = Dictionary<Int,String>()

    func emoji(for card: Card) -> String {

        if emoji[card.id] == nil, emojiChoice.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoice.count)))
            emoji[card.id] = emojiChoice.remove(at: randomIndex)
        }

        if emoji[card.id] != nil {
            return emoji[card.id]!
        } else {
            return "?"
        }

    }



}

