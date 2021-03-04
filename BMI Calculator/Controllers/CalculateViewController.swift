

import UIKit

class CalculateViewController: UIViewController {

    
    
    var calculatorBrain = CalculatorBrain()
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var hightSlider: UISlider!
    
    
    @IBOutlet weak var weightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = ("\(height)m")
      
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
       let weight = String(format: "%.f", sender.value)
        weightLabel.text = ("\(weight)")
       
    }
    
    @IBAction func calcullatePressed(_ sender: UIButton) {
        let height = hightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = self.calculatorBrain.getBmiValue()
            destinationVC.color = self.calculatorBrain.getColor()
            destinationVC.advice = self.calculatorBrain.getAdvice()
        }
    }
}
