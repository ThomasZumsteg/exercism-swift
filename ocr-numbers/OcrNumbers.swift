typealias OCR_digit = [[Character]] // 4 rows, 3 columns

class OCR {
    var ocr_digits: [[OCR_digit]] = []
    
    /*Error occur when the input is improperly formatted*/
    enum Error: ErrorType {
        case InvalidNumberOfLines, InvalidNumberOfColumns
    }
    
    /*init parses the input text*/
    init(_ text: String) throws {
        let lines = text.characters.split{$0 == "\n"}.map{Array($0)}
        for var l = 0; l != lines.count; l += 4 {
            if lines.count < l+4 {
                throw Error.InvalidNumberOfLines
            }
            
            var line: [OCR_digit] = []
            
            for var c = 0; c != lines[l].count; c += 3 {
                if lines[l].count < c+3 {
                    throw Error.InvalidNumberOfColumns
                }
            
                let digit: OCR_digit = [
                    Array(lines[l  ][c..<c+3]),
                    Array(lines[l+1][c..<c+3]),
                    Array(lines[l+2][c..<c+3]),
                    Array(lines[l+3][c..<c+3])
                ]
                
                line.append(digit)
            }
            ocr_digits.append(line)
        }
    }
    
    /*converted turns the OCR digits into ascii digits*/
    func converted() -> String {
        return ocr_digits.map({ (line: [OCR_digit]) -> String in
            line.map({(digit: OCR_digit) -> String in
                convertDigit(digit)}).joinWithSeparator("")
        }).joinWithSeparator(",")
    }
    
    /*convertDigit converts a single OCR_digit into a string*/
    private func convertDigit(digit: OCR_digit) -> String {
        let strDigit: String = digit
            .map({String($0)})
            .joinWithSeparator("\n")

        if let index = digits.indexOf(strDigit) {
            return String(index)
        } else {
            return "?"
        }
    }
    
    /*digits representation of digit is stored in the index*/
    private let digits = [
        " _ \n" +
        "| |\n" +
        "|_|\n" +
        "   ",
    
        "   \n" +
        "  |\n" +
        "  |\n" +
        "   ",
    
        " _ \n" +
        " _|\n" +
        "|_ \n" +
        "   ",
    
        " _ \n" +
        " _|\n" +
        " _|\n" +
        "   ",
    
        "   \n" +
        "|_|\n" +
        "  |\n" +
        "   ",
    
        " _ \n" +
        "|_ \n" +
        " _|\n" +
        "   ",
    
        " _ \n" +
        "|_ \n" +
        "|_|\n" +
        "   ",
    
        " _ \n" +
        "  |\n" +
        "  |\n" +
        "   ",
    
        " _ \n" +
        "|_|\n" +
        "|_|\n" +
        "   ",
    
        " _ \n" +
        "|_|\n" +
        " _|\n" +
        "   ",
    ]
}