import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    var color: UIColor?
    var advice: String?
    
    func getBmiValue() -> String{
        
        let bmiValue = String(format: "%.1f", bmi?.value ?? 0.0)
           return bmiValue
       }
   
    
    mutating func calculateBMI(height: Float, weight: Float)  {
        
        let bmiValue = weight / (height  * height)
        
        if bmiValue < 18.5{
            self.color = .blue
            self.advice = "Eat more pie"
            bmi = BMI (value: bmiValue, advice: "Eat more pie", color: .blue)
        }else if bmiValue < 24.9{
            self.color = .green
            self.advice = "Fit as a fiddle"
            bmi = BMI (value: bmiValue, advice: "Fit as a fiddle", color: .green)
        }else{
            self.color = .red
            self.advice = "Eat less"
            bmi = BMI (value: bmiValue, advice: "Eat less", color: .red)
        }
       
    }
    
    func getColor() -> UIColor{
        return color ?? .white
    }
    func getAdvice() -> String{
        return advice ?? "sonething go wrong"
    }
   
}
