//
//  Appearance.swift
//  JobFinder
//
//  Created by Josh Arnold on 11/26/20.
//

import Foundation
import UIKit


extension UIColor {
    static var primary: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                return traits.userInterfaceStyle == .dark ?
                    UIColor(red: 43/255, green: 240/255, blue: 151/255, alpha: 1) :
                    UIColor(red: 38/255, green: 224/255, blue: 140/255, alpha: 1)
            }
        } else {
            return UIColor(red: 38/255, green: 224/255, blue: 140/255, alpha: 1)
        }
    }
}


extension UIFont {
    
    static var largeTitle:UIFont {
        return UIFont.init(name: "Avenir Next", size: 32)!
    }
    
    static var title:UIFont {
        return UIFont.init(name: "AvenirNext-Bold", size: 15)!
    }
    
    static var label:UIFont {
        return UIFont.init(name: "AvenirNextCondensed-Regular", size: 15)!
    }
    
    static var desc:UIFont {
        return UIFont.init(name: "Avenir Next", size: 15)!
    }
    
    static var detail:UIFont {
        return UIFont.init(name: "AvenirNextCondensed-Bold", size: 12)!
    }
}


extension UIViewController {
    
    func removeNavBarLine() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}
