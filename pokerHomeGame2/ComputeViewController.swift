//
//  ComputeViewController.swift
//  pokerHomeGame2
//
//  Created by Vlad Barash on 1/11/17.
//  Copyright © 2017 Vlad Barash. All rights reserved.
//

import Foundation
import UIKit

class ComputeViewController: UIViewController {
    
    
    @IBOutlet weak var name1: UITextField!
    @IBOutlet weak var start1: UITextField!
    @IBOutlet weak var end1: UITextField!
    @IBOutlet weak var name2: UITextField!
    @IBOutlet weak var start2: UITextField!
    @IBOutlet weak var end2: UITextField!
    @IBOutlet weak var name3: UITextField!
    @IBOutlet weak var start3: UITextField!
    @IBOutlet weak var end3: UITextField!
    @IBOutlet weak var name4: UITextField!
    @IBOutlet weak var start4: UITextField!
    @IBOutlet weak var end4: UITextField!
    @IBOutlet weak var name5: UITextField!
    @IBOutlet weak var start5: UITextField!
    @IBOutlet weak var end5: UITextField!
    @IBOutlet weak var name6: UITextField!
    @IBOutlet weak var start6: UITextField!
    @IBOutlet weak var end6: UITextField!
    @IBOutlet weak var name7: UITextField!
    @IBOutlet weak var start7: UITextField!
    @IBOutlet weak var end7: UITextField!
    @IBOutlet weak var name8: UITextField!
    @IBOutlet weak var start8: UITextField!
    @IBOutlet weak var end8: UITextField!
    
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    
    
    
    
    @IBAction func compute(_ sender: Any) {
        // sort names and chip value differences from lowest to highest
        
        var nameArray = [String]()
        var startArray = [Double]()
        var endArray = [Double]()
        var difference = [String: Double]()
        
        nameArray.append(name1.text!)
        nameArray.append(name2.text!)
        nameArray.append(name3.text!)
        nameArray.append(name4.text!)
        nameArray.append(name5.text!)
        nameArray.append(name6.text!)
        nameArray.append(name7.text!)
        nameArray.append(name8.text!)
        
        startArray.append(Double(start1.text!)!)
        startArray.append(Double(start2.text!)!)
        startArray.append(Double(start3.text!)!)
        startArray.append(Double(start4.text!)!)
        startArray.append(Double(start5.text!)!)
        startArray.append(Double(start6.text!)!)
        startArray.append(Double(start7.text!)!)
        startArray.append(Double(start8.text!)!)
        
        endArray.append(Double(end1.text!)!)
        endArray.append(Double(end2.text!)!)
        endArray.append(Double(end3.text!)!)
        endArray.append(Double(end4.text!)!)
        endArray.append(Double(end5.text!)!)
        endArray.append(Double(end6.text!)!)
        endArray.append(Double(end7.text!)!)
        endArray.append(Double(end8.text!)!)
        
        difference[nameArray[0]] = endArray[0] - startArray[0]
        difference[nameArray[1]] = endArray[1] - startArray[1]
        difference[nameArray[2]] = endArray[2] - startArray[2]
        difference[nameArray[3]] = endArray[3] - startArray[3]
        difference[nameArray[4]] = endArray[4] - startArray[4]
        difference[nameArray[5]] = endArray[5] - startArray[5]
        difference[nameArray[6]] = endArray[6] - startArray[6]
        difference[nameArray[7]] = endArray[7] - startArray[7]
        
        var nameSorted = [String]()
        var differenceSorted = [Double]()
        
        for (k,v) in Array(difference).sorted(by: {$0.1 < $1.1}) {
            nameSorted.append(k)
            differenceSorted.append(v)
        }
                
        // proceed to loop through and determine who owes who what, only if the starting and ending chip counts match
        
        var results = ""
        
        let sumStart = startArray.reduce(0, +)
        let sumEnd = endArray.reduce(0, +)
        
        if sumStart != sumEnd {
            // popup
            let alert = UIAlertController(title: "Error", message: "Starting and ending chip counts don't match", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        } else {
            var y = differenceSorted.count - 1
            
            for i in 0...nameSorted.count-1 {
                
                while differenceSorted[i] < 0 {
                    
                    if abs(differenceSorted[i]) > differenceSorted[y] {
                        let name = nameSorted[i]
                        let amount = String(abs(differenceSorted[y]))
                        let name2 = nameSorted[y]
                        let r = name + " to send " + amount + " to " + name2
                        
                        results = results + "\n" + r
                        
                        differenceSorted[i] += differenceSorted[y]
                        differenceSorted[y] -= differenceSorted[y]
                    } else if abs(differenceSorted[i]) <= differenceSorted[y] {
                        let name = nameSorted[i]
                        let amount = String(abs(differenceSorted[i]))
                        let name2 = nameSorted[y]
                        let r = name + " to send " + amount + " to " + name2
                        
                        results = results + "\n" + r
                        
                        differenceSorted[y] -= abs(differenceSorted[i])
                        differenceSorted[i] += abs(differenceSorted[i])
                    }
                    
                    if differenceSorted[y] == 0 {
                        y-=1
                    }
                    
                }
                
            }
            
        }
        print(results)
        resultsLabel.text = String(results)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

