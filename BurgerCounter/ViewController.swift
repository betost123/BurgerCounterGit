//
//  ViewController.swift
//  BurgerCounter
//
//  Created by Betina Andersson on 2018-09-05.
//  Copyright © 2018 Betina Andersson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var bc = BurgerCounter()
    
    // MARK: Properties
    @IBOutlet var shopListCollection: [UILabel]!
    
    @IBOutlet weak var typedBurgerAmount: UITextField!
    @IBOutlet weak var burgerAmountLabel: UILabel!
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        burgerAmountLabel.text = textField.text != nil ? "\(textField.text!) 🍔" : "🍔"
        bc.countBurgerSupplemeants(basedOnBread: Int(typedBurgerAmount.text!) ?? 0)
        updateViewFromModel()
    }
    
    // MARK: Actions
    @IBAction func setBurgerAmount(_ sender: UIButton) {
        bc.countBurgerSupplemeants(basedOnBread: Int(typedBurgerAmount.text!) ?? 0)
        updateViewFromModel()
    }
    
    // MARK: Functions
    func updateViewFromModel() {
        shopListCollection[0].text = "🥩 \(bc.meat) st"
        shopListCollection[1].text = "🥦 \(bc.salad) st"
        shopListCollection[2].text = "🧀 \(bc.cheese) förp."
        shopListCollection[3].text = "🍅 \(bc.tomato) kg"
        shopListCollection[4].text = "🌰 \(bc.onion) kg"
        shopListCollection[5].text = "🔮 \(bc.xtraAllt)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Handle the text field’s user input through delegate callbacks.
        typedBurgerAmount.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

