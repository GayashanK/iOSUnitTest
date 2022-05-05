//
//  ViewController.swift
//  MyApp
//
//  Created by Bear Cahill on 3/26/18.
//  Copyright © 2018 Bear Cahill. All rights reserved.
//

import UIKit

class TipCalc {
    
    func calcTip(amount: Double, tipPrec: Double) -> Double {
        return amount / 100.0 * tipPrec
    }

}

//class MusicModel {
//    func fetchMusic(completion: @escaping([[String:Any]]?, Error?)-> Void) {
//
//    }
//
//    func parseJSON(data: Data) -> [[String:Any]]? {
//        return try? JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
//    }
//}

class MusicModel {
    var cache : [[String:Any]]?
    var fetchDate : Date?
    
    func refresh() {
        cache = nil
        fetchDate = nil
        fetchMusic { (newData, error) in
            if newData != nil {
                self.fetchDate = Date()
            }
        }
    }
    
    func fetchMusic(completion : @escaping ([[String:Any]]?, Error?)->Void) {
        guard cache == nil else { completion(cache, nil); return }
        
        let dt = URLSession.shared.dataTask(with: URL.init(string: "https://orangevalleycaa.org/api/music")!) { (data, response, error) in
            completion(self.parseJSON(data: data), error)
        }
        dt.resume()
    }
    
    func parseJSON(data : Data?) -> [[String:Any]]? {
        if let data = data {
            cache = try? JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
            return cache
        }
        return nil
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var amountTF: UITextField!
    @IBOutlet weak var calcBtn: UIButton!
    @IBOutlet weak var tipLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calcTapped(_ sender: Any) {
        if let amount = Double(self.amountTF.text!)  {
            let tipCalc = TipCalc()
            let tip = tipCalc.calcTip(amount: amount, tipPrec: 50.0)
            self.tipLbl.text = "Tip - \(tip)"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

