import Foundation


enum NumberClassification {
    case Deficient, Perfect, Abundant
}

class NumberClassifier {
    var classification: NumberClassification!
    
    init(number: Int) {
        let sum = factors(number).reduce(0, combine: +)
        switch true {
        case sum < number:
            classification = NumberClassification.Deficient
        case sum == number:
            classification = NumberClassification.Perfect
        default:
            classification = NumberClassification.Abundant
        }
    }
    
    private func factors(n: Int) -> Set<Int> {
        var factors: Set<Int> = [1]
        let limit = Int(pow(Double(n), 0.5))
        for f in 2...limit {
            if n % f == 0 {
                factors.unionInPlace([f, n / f])
            }
        }
        return factors
    }
}
