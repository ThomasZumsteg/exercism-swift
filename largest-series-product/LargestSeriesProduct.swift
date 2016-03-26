/*NumberSeries finds the largest slice of numbers*/
class NumberSeries {
    var series: [Int] = []
    
    /*Errors are problems doing the computation*/
    enum Error: ErrorType {
        case SpanLongerThanStringLength, InvalidCharacter, NegativeSpan
    }
    
    /*init converts the string to an array of numbers*/
    init(_ chars: String) throws {
        for char in chars.characters {
            if let n = Int(String(char)) {
                series.append(n)
            } else {
                throw NumberSeries.Error.InvalidCharacter
            }
        }
    }
    
    /*largestProduct finds the slice that when the digits are multipled together produce the biggest result*/
    func largestProduct(slice_size: Int) throws -> Int {
        
        if slice_size < 0 {
            throw NumberSeries.Error.NegativeSpan
        } else if series.count < slice_size {
            throw NumberSeries.Error.SpanLongerThanStringLength
        }
        
        var largestProduct = 0
        for var start = 0, stop = slice_size; stop <= series.count; start++, stop++ {
            let product = series[start..<stop].reduce(1, combine: { $0 * $1} )
            if largestProduct < product {
                largestProduct = product
            }
        }
        return largestProduct
    }
}