import Foundation

class Nucleotide {
    let nucleotides: String
    private let dnaToRna: [Character: Character] = [
        "G": "C",
        "T": "A",
        "A": "U",
        "C": "G",
    ]
    private let rnaToDna: [Character: Character]
    
    init(_ string: String) {
        nucleotides = string
        rnaToDna = Nucleotide.invert(dnaToRna)
    }
    
    var complementOfDNA: String {
        get {
            return String(nucleotides
                .characters
                .map{dnaToRna[$0]!}
            )
        }
    }
    
    var complementOfRNA: String {
        get {
            return String(nucleotides
                .characters
                .map{rnaToDna[$0]!}
            )
        }
    }
    
    private static func invert<K, V>(dict: [K: V]) -> [V: K] {
        var invDict = [V:K]()
        for (k, v)in dict {
            invDict[v] = k
        }
        return invDict
    }
}