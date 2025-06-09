//
//  ViewController.swift
//  CalculadoraIMC-iOS
//
//  Created by Tardes on 6/6/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var weight: Float = 70
    var height: Float = 160
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onWeightChanged(_ sender: UIStepper) {
        weight = Float(sender.value)
        weightLabel.text = "\(Int(weight)) kg"
    }
    
    @IBAction func onHeightChanged(_ sender: UISlider) {
        height = sender.value
        heightLabel.text = "\(Int(height)) cm"
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        let heightInMeter: Float = height / Float(100)
                let bmi: Float = weight / pow(heightInMeter, 2)
                resultLabel.text = "\(String(format: "%.2f", bmi))"
            }
    
}

