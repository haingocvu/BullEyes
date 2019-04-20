import UIKit

extension UIViewController {
	func calcDiff<T: Comparable&SignedNumeric>(num1: T, num2: T) -> T{
		return abs(num1 - num2)
	}
}
