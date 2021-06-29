//
//  ViewController.swift
//  AQIDemi
//
//  Created by Apple on 21/06/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import Starscream




class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var aqiLbl: UILabel!
    @IBOutlet weak var lastUpdated: UILabel!
    var ValidationAqivalue = [ValidationAqi]()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SocketHandler.sharedInstance.connectToSocket()
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadScreen(notification:)), name: NSNotification.Name(rawValue: "updateData"), object: nil)
        tableView.tableFooterView = UIView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    @objc func reloadScreen(notification: NSNotification) {
        print("updated arr : \(SocketHandler.sharedInstance.arrData)")
        self.tableView.reloadData()
    }
    
    
    
}


extension UIViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SocketHandler.sharedInstance.arrData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : ContentTableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "CellCustom") as? ContentTableViewCell
        if cell == nil {
            cell = ContentTableViewCell(style: .default, reuseIdentifier: "CellCustom")
        }
        let data = SocketHandler.sharedInstance.arrData[indexPath.row]
        cell.countryNameLbl?.text = data.city ?? ""
        let aqi: Double = data.aqi ?? 0
        ValidationAqi(aqiValuefrominit: aqi)
        if let userSelectedColorData = UserDefaults.standard.object(forKey: "status") as? Data {
            if let userSelectedColor = NSKeyedUnarchiver.unarchiveObject(with:userSelectedColorData as Data) as? UIColor {
                cell.aqiLbl.textColor = userSelectedColor
            }
        }
        cell.aqiLbl?.text = String(format: "%.2f", aqi)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = SocketHandler.sharedInstance.arrData[indexPath.row]
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChartViewController") as? ChartViewController {
            vc.modalPresentationStyle = .fullScreen
            vc.countryName = data.city ?? ""
            vc.aqiDisplay =  data.aqi ?? 0
            self.present(vc, animated: true, completion: nil)
        }
       
    }
}

