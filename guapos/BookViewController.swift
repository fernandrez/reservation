
import Foundation
import UIKit

class BookViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var numberOptions = ["1","2","3","4","5","6","7","8","9","10 or more"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.pickerView.dataSource = self
        //self.pickerView.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOptions.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numberOptions[row]
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        let value = Int(textField.text ?? "") ?? 0
        if value > 0 || value < 100 {
            //Here you can present an alert, change the input or clear the field.
        }
    }
    
    @IBAction func postReservation(_ sender: UIButton) {
        
        let parameters: [String: Any] = [
            "id": 13,
            "name": "Jack & Jill"
        ]
        
        
        let completion = { (result: NSString?) in print(result!) }
        post(link: "https://postman-echo.com/post", passedPostString: parameters.percentEscaped().data(using: .utf8), completion: completion)
    }
}

func post(link:String,passedPostString:Data?, completion: @escaping (NSString?) -> ()) {
    let request = NSMutableURLRequest(url: NSURL(string: link)! as URL)
    request.httpMethod = "POST"
    
    request.httpBody = passedPostString
    
    let task = URLSession.shared.dataTask(with: request as URLRequest) {
        data, response, error in
        
        if error != nil {
            print("error=\(String(describing: error))")
            print("******Error*****")
            return
            
        }
        let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
        
        completion(responseString!);
    }
    task.resume()
}

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
            }
            .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}

struct Booking {
    
}
