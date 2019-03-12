//
//  DataViewController.swift
//  guapos_swift
//
//  Created by Andrés Fernández on 05/03/2019.
//  Copyright © 2019 Andrés Fernández. All rights reserved.
//

import UIKit

struct Constants {
    static let reservationOnlineButton = 1
    static let orderOnlineButton = 2
}

class HomeViewController: UIViewController {
    
    var testViewController: TestViewController?
    var dataObject: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func switchViews(_ sender: UIButton){
        let tag = sender.tag;
        
        // Create the new view controller, if required.
        if (tag == Constants.orderOnlineButton) {
            if (testViewController == nil) {
                testViewController = (self.storyboard?.instantiateViewController(withIdentifier: "Test") as! TestViewController)
            }
        }
        
        // Switch view controllers.
        if (tag == Constants.orderOnlineButton) {
            testViewController?.view.frame = view.frame
            switchToViewController(testViewController)
            //present(UIViewController: testViewController, animated: true, completion: nil)
        }
    }
    
    func switchToViewController(_ toVC: UIViewController?) {
        if (toVC != nil) {
            addChild((toVC)!)
            view.addSubview((toVC?.view)!)
            toVC?.didMove(toParent: self)
        }
    }
    
    @IBAction func homeUnwind(_ segue: UIStoryboardSegue)
    {}
}

