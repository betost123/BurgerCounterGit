//
//  ViewController.swift
//  BurgerCounter
//
//  Created by Betina Andersson on 2018-09-05.
//  Copyright © 2018 Betina Andersson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //lazy var bc = BurgerCounter(bread: Int(typedBurgerAmount.text!) ?? 0)
    var bc = BurgerCounter()
    
    // MARK: Properties
    @IBOutlet weak var typedBurgerAmount: UITextField!
    @IBOutlet weak var burgerAmountLabel: UILabel!
    @IBOutlet weak var meatLabel: UILabel!
    @IBOutlet weak var saladLabel: UILabel!
    @IBOutlet weak var cheeseLabel: UILabel!
    @IBOutlet weak var tomatoLabel: UILabel!
    @IBOutlet weak var onionLabel: UILabel!
    @IBOutlet weak var xtraAlltLabel: UILabel!
    
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
        meatLabel.text = "🥩 \(bc.meat) st"
        saladLabel.text = "🥦 \(bc.salad) st"
        cheeseLabel.text = "🧀 \(bc.cheese) förp."
        tomatoLabel.text = "🍅 \(bc.tomato) kg"
        onionLabel.text = "🌰 \(bc.onion) kg"
        xtraAlltLabel.text = "🔮 \(bc.xtraAllt)"
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

