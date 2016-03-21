import Foundation

/*Heading is the directions on a compass, ordered clockwise*/
enum Heading: Int {
    case North, East, South, West
}

/*Commands the things a robot can do*/
enum Commands {
    case TurnRight, TurnLeft, Advance
}

/*SimulatedRobot creates a robot to simulate*/
func SimulatedRobot() -> Robot {
    return Robot()
}


/*Robot creates a robot that walks in some directions*/
class Robot {
    var bearing: Heading = .North
    var coordinates: [Int] = [0,0]
    
    /*orient give the robot a direction*/
    func orient(bearing: Heading) {
        self.bearing = bearing
    }
    
    /*turnRight turn the robot right*/
    func turnRight() {
        bearing = Heading(rawValue: (bearing.rawValue + 1) % 4)!
    }
    
    /*turnLeft turns the robot left*/
    func turnLeft() {
        bearing = Heading(rawValue: (bearing.rawValue + 3) % 4)!
    }
    
    /*advance moves the robot forward one step*/
    func advance() {
        switch bearing {
        case .North: coordinates[1] += 1
        case .East: coordinates[0] += 1
        case .South: coordinates[1] -= 1
        case .West: coordinates[0] -= 1
        }
    }
    
    /*at puts the robot at some position*/
    func at(x x: Int, y: Int) {
        coordinates = [x, y]
    }
    
    /*place give the robot a position and heading*/
    func place(x x: Int, y: Int, direction: Heading) {
        orient(direction)
        at(x: x, y: y)
    }
    
    /*instructions give the robot a number of commands*/
    func instructions(steps: String) -> [Commands] {
        var commands: [Commands] = []
        for char in steps.characters {
            switch char {
            case "L": commands.append(Commands.TurnLeft)
            case "R": commands.append(Commands.TurnRight)
            case "A": commands.append(Commands.Advance)
            default: break
            }
        }
        return commands
    }
    
    /*evaluate preformes a series of commands on a robot*/
    func evaluate(steps: String) {
        for step in self.instructions(steps) {
            switch step {
            case .TurnLeft: self.turnLeft()
            case .TurnRight: self.turnRight()
            case .Advance: self.advance()
            }
        }
    }
}