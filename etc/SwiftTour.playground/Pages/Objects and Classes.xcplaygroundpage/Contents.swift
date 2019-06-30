import Foundation

class Shape {
    var numberOfSides = 0

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

let shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
print(shapeDescription)


class NamedShape {
    var numerOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numerOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numerOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A squre with sides of length \(sideLength)"
    }
}

class Circle: NamedShape {

    var radius: Double

    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }

    func area() -> Double {
        return .pi * radius * radius
    }

    var diameter: Double {
        get {
            return radius * 2.0
        }
        set {
            radius = newValue / 2.0
        }
    }

    var circumference: Double {
        get {
            return 2.0 * .pi * radius
        }
        set {
            radius = newValue / (.pi * 2.0)
        }
    }

    override func simpleDescription() -> String {
        return "An circle with \(radius) radius."
    }
}

print(Circle(radius: 10, name: "This is circle").area())

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numerOfSides = 3
    }

    func area() -> Double {
        return sqrt(3) / 4 * sideLength * sideLength
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = perimeter / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilaeral triangle with side of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 10, name: "a triangle")
print(triangle.perimeter)
print(triangle.area())

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }

    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }

    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)

triangleAndSquare.square = Square(sideLength: 50, name: "larger sqaure")
print(triangleAndSquare.triangle.sideLength)

// Optional values
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
