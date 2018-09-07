//
//  BurgerCounter.swift
//  BurgerCounter
//
//  Created by Betina Andersson on 2018-09-05.
//  Copyright © 2018 Betina Andersson. All rights reserved.
//

import Foundation

class BurgerCounter {
    var bread = 0;
    var meat = 0;
    var salad = 0;
    var cheese = 0;
    var tomato = 0;
    var onion = 0;
    var xtraAllt = ""
    
    func countBurgerSupplemeants(basedOnBread bread : Int) {
        meat = Int(Double(bread) * 1.5)
        salad = Int(Double(bread) * 0.06)+1
        cheese = (bread < 88) ? (1) : bread % 88 != 0 ? Int(bread/88)+1 : Int(bread/88)
        tomato = Int(Double(bread) * 0.03)
        onion = Int(Double(bread) * 0.014)
        xtraAlltrandom()
        
    }
    
    func xtraAlltrandom(){
        let randomNum = Int(arc4random_uniform(UInt32(7)))
        switch randomNum {
        case 0:
            xtraAllt = "Pepper Jack Cheese"
        case 1:
            xtraAllt = "Cheddar"
        case 2:
            xtraAllt = "Vitlökssås"
        case 3:
            xtraAllt = "Chorizo"
        case 4:
            xtraAllt = "Avokado"
        case 5:
            xtraAllt = "Picklad rödlök"
        case 6:
            xtraAllt = "Coleslaw"
        default:
            xtraAllt = "Bacon"
        }
        
    }
}
