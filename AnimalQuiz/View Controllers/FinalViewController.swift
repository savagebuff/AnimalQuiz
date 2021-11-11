//
//  FinalViewController.swift
//  AnimalQuiz
//
//  Created by Dinar Garaev on 10.11.2021.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet var whoIsYouLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    // array with choosen answers
    var answers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true

        let mostFrequencyOfAnimal = getAnimal(from: answers)
        whoIsYouLabel.text = "Вы - \(mostFrequencyOfAnimal)!"
        
        
    }
}

extension FinalViewController {
    private func getAnimal(from answer: [Answer]) -> String {
        
        var frequencyOfAnimal: [AnimalType : Int] = [:]
        let animals = answers.map {$0.type}
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimal[animal] {
                frequencyOfAnimal.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimal[animal] = 1
            }
        }
        
        for animal in animals {
            frequencyOfAnimal[animal] = (frequencyOfAnimal[animal] ?? 0) + 1
        }
        
        let sortedFrequencyOfAnimal = frequencyOfAnimal.sorted { $0.value > $1.value }
        guard let mostFrequencyOfAnimal = sortedFrequencyOfAnimal.first?.key else { return "" }
        
        return String(mostFrequencyOfAnimal.rawValue)
    }
}

