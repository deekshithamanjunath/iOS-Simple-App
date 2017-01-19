//
//  ViewController.swift
//  Assignment3
//
//  Created by Deekshitha Manjunath on 10/8/16.
//  Copyright © 2016 Deekshitha Manjunath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var inputText: UITextField!
    @IBOutlet var x: UITextField!
    @IBOutlet var y: UITextField!
    @IBOutlet var movingLabel: UILabel!
    
    let revert = UserDefaults.standard
    
    var xValue:Double?
    var yValue:Double?
    
    var position = CGPoint(x: 0, y: 0)
    
    @IBAction func update() {
        movingLabel.text = inputText.text
        xValue = Double(x.text!)
        yValue = Double(y.text!)
        
        if inputText.text != ""
        {
            if xValue != nil && yValue != nil
        {
            movingLabel.center = CGPoint(x: xValue!, y: yValue!)
        }
        self.view.endEditing(true)
        
        if (movingLabel.text != nil)
        {
            revert.set(inputText.text, forKey: "input")
            revert.set(x.text!, forKey: "xin")
            revert.set(y.text!, forKey: "yin")
        }
        }
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
        let move:UITouch! = touches.first! as UITouch
        position = move.location(in: self.view)
        movingLabel.center = position
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let move:UITouch! = touches.first! as UITouch
        position = move.location(in: self.view)
        movingLabel.center = position
        x.text = String(describing: position.x)
        y.text = String(describing: position.y)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if ((revert.object(forKey: "input")) != nil)
        {
            inputText.text = revert.string(forKey: "input")
            x.text = revert.string(forKey: "xin")
            y.text = revert.string(forKey: "yin")
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

