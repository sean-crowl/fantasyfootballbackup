//
//  InjuriesViewController.swift
//  teamFantasy
//
//  Created by David  Bowen on 11/16/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireSwiftyJSON

class InjuriesViewController: UIViewController {
    
    @IBOutlet weak var injuriesList: UITextView!
    
    var myArray: [String] = [ ]
    
    var date = Date()
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return dateFormatter.string(from: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dateString)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBAction func getInjuries(_ sender: Any) {
        injuriesList.text = ""
        myArray.removeAll()
        Alamofire.request("http://www.fantasyfootballnerd.com/service/injuries/json/cpsp3g6kz9da").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
        
                guard let injuries = json[Constants.API.ARIKey].array else { print("no"); fatalError() }
                print(injuries.count)
                
                for injurie in injuries {
                    print("\(injuries.index(of: injurie)! + 1). \(injurie[Constants.API.PlayerNameKey].string!)")
                }
                
            case .failure(let error) :
            fatalError(error.localizedDescription)
            
        }
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
}
