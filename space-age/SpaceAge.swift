import Foundation

class SpaceAge {
    let seconds: Int!
    var onMercury, onVenus, onEarth, onMars,
        onJupiter, onSaturn, onUranus, onNeptune
        : Double!
    
    init(_ age: Int) {
        self.seconds = age

        onMercury = getAge(0.2408467)
        onVenus = getAge(0.61519726)
        onEarth = getAge(1.0)
        onMars = getAge(1.8808158)
        onJupiter = getAge(11.862615)
        onSaturn = getAge(29.447498)
        onUranus = getAge(84.016846)
        onNeptune = getAge(164.79132)
    }
    
    private func getAge(scale: Double) -> Double {
        return round( Double(self.seconds) / (315576.0 * scale)) / 100.0
    }
    
    
}