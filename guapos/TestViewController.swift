
import Foundation
import UIKit

class TestViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func buttonPressGoBack(_ sender: UIButton) {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
