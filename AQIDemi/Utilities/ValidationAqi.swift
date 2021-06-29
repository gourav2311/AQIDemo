//
//  ValidationAqi.swift
//  AQIDemi
//
//  Created by gourav jaiswal on 26/06/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import UIKit





struct  ValidationAqi  {
    
    
    
    var aqiValue:Double
   
    
    init(aqiValuefrominit:Double) {
        self.aqiValue = aqiValuefrominit
        aqivalidationmethod(aqivalue: aqiValue)
    }
    
    
    func aqivalidationmethod(aqivalue:Double) {
        
        if((0...50).contains(aqiValue)){
            
            self.airqualityStatusmethod(status: "good", colour: "106,165,90")
            let colorToSetAsDefault : UIColor = UIColor(red: 106.0/255, green: 165.0/255, blue: 90.0/255, alpha: 1.0)
            let data : Data = NSKeyedArchiver.archivedData(withRootObject: colorToSetAsDefault) as Data
            UserDefaults.standard.set(data, forKey: "status")
            UserDefaults.standard.synchronize()
            
           
            
            
            
        }
        
        if((51...100).contains(aqiValue)){
            
            self.airqualityStatusmethod(status: "Staisfactory", colour: "171,198,100")
            let colorToSetAsDefault : UIColor = UIColor(red: 171.0/255, green: 198.0/255, blue: 100.0/255, alpha: 1.0)
                       let data : Data = NSKeyedArchiver.archivedData(withRootObject: colorToSetAsDefault) as Data
                       UserDefaults.standard.set(data, forKey: "status")
                       UserDefaults.standard.synchronize()
            
            
        }
        
        // ()
        
        if((101...200).contains(aqiValue)){
            
             self.airqualityStatusmethod(status: "Moderate", colour: "231,159,75")
       
            
            let colorToSetAsDefault : UIColor = UIColor(red: 252.0/255, green: 244.0/255, blue: 94.0/255, alpha: 1.0)
            let data : Data = NSKeyedArchiver.archivedData(withRootObject: colorToSetAsDefault) as Data
            UserDefaults.standard.set(data, forKey: "status")
            UserDefaults.standard.synchronize()
            
            
        }
        
        if((201...300).contains(aqiValue)){
            
            self.airqualityStatusmethod(status: "poor", colour: "231,159,75")
            let colorToSetAsDefault : UIColor = UIColor(red: 231.0/255, green: 159.0/255, blue: 75.0/255, alpha: 1.0)
                       let data : Data = NSKeyedArchiver.archivedData(withRootObject: colorToSetAsDefault) as Data
                       UserDefaults.standard.set(data, forKey: "status")
                       UserDefaults.standard.synchronize()
            
            
        }
        
        if((301...400).contains(aqiValue)){
            
            self.airqualityStatusmethod(status: "very poor", colour: "193,68,55")
            
            let colorToSetAsDefault : UIColor = UIColor(red: 193.0/255, green: 68.0/255, blue: 55.0/255, alpha: 1.0)
                                  let data : Data = NSKeyedArchiver.archivedData(withRootObject: colorToSetAsDefault) as Data
                                  UserDefaults.standard.set(data, forKey: "status")
                                  UserDefaults.standard.synchronize()
            
            
        }
        
        if((401...500).contains(aqiValue)){
            
            self.airqualityStatusmethod(status: "servere", colour: "162,56,44")
            let colorToSetAsDefault : UIColor = UIColor(red: 162.0/255, green: 56.0/255, blue: 44.0/255, alpha: 1.0)
                                             let data : Data = NSKeyedArchiver.archivedData(withRootObject: colorToSetAsDefault) as Data
                                             UserDefaults.standard.set(data, forKey: "status")
                                             UserDefaults.standard.synchronize()
            
            
        }
        
        
        
        
    }
    
    func airqualityStatusmethod(status: NSString,colour:NSString) {
        
        UserDefaults.standard.set(status, forKey: "statusquality")
        UserDefaults.standard.set(colour, forKey: "color")
        
        
    }
    
    
    
}


