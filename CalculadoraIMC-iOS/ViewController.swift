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
    @IBOutlet weak var resultTextLabel: UILabel!
    
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
        
        var showAlert = false
        
        switch bmi {
            case ..<18.5:
            resultTextLabel.text = "Bajo peso"
            resultTextLabel.textColor = .bmiUnderweight
            resultLabel.textColor = .bmiUnderweight
            case 18.5..<25:
            resultTextLabel.text = "Peso normal"
            resultTextLabel.textColor = .bmiNormalWeight
            resultLabel.textColor = .bmiNormalWeight
            case 25..<30:
            resultTextLabel.text = "Sobrepeso"
            resultTextLabel.textColor = .bmiOverweight
            resultLabel.textColor = .bmiOverweight
            case 30..<35:
            resultTextLabel.text = "Obesidad"
            resultTextLabel.textColor = .bmiObesity
            resultLabel.textColor = .bmiObesity
            showAlert = true
            default:
            resultTextLabel.text = "Obesidad extrema"
            resultTextLabel.textColor = .bmiExtremeObesity
            resultLabel.textColor = .bmiExtremeObesity
            showAlert = true
            }
        
        if showAlert {
                    let alert = UIAlertController(
                        title: "Riesgo de salud",
                        message: "Tu peso actual pone en grave riesgo tu vida. Busca ayuda médica cuanto antes.",
                        preferredStyle: .alert
                    )
                    alert.addAction(UIAlertAction(title: "Mas información", style: .default, handler: { action in
                        // He pulsado mas información
                        let adviceSiteUrl = "https://medlineplus.gov/spanish/ency/patientinstructions/000348.htm"
                        if let url = URL(string: adviceSiteUrl), UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }))
            alert.addAction(UIAlertAction(title: "Cerrar", style: .destructive, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
        }
    
    
}

