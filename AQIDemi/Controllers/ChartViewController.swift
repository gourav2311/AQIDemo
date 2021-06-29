//
//  ChartViewController.swift
//  AQIDemi
//
//  Created by gourav jaiswal on 27/06/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import Charts


class ChartViewController: UIViewController {
    
    var countryName = String()
    var aqiDisplay  =  Double()
    @IBOutlet var chartView: PieChartView!
    var propertiesCount = [PieChartDataEntry]()
     var Aqivalue = PieChartDataEntry(value: 0)
     var ValidationAqivalue = [ValidationAqi]()
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpChart()
        setDateColour()
        
        
        
    }
    
    func setUpChart(){
        self.title = "Pie Chart for AQI"
         ValidationAqi(aqiValuefrominit: aqiDisplay)
        
         
        Aqivalue = PieChartDataEntry(value: aqiDisplay,label: countryName)

                 let l = chartView.legend
                 l.horizontalAlignment = .right
                 l.verticalAlignment = .top
                 l.orientation = .vertical
                 l.xEntrySpace = 7
                 l.yEntrySpace = 0
                 l.yOffset = 0
         //        chartView.legend = l

                 // entry label styling
                 chartView.entryLabelColor = .black
        chartView.entryLabelFont = .systemFont(ofSize: 12, weight: .bold)
                 self.chartView.centerText = "AQI Chart"

                 
         self.propertiesCount = [self.Aqivalue]
                 chartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
         
        
        
    }
    
    
    func setDateColour(){
         let status =  UserDefaults.standard.string(forKey: "statusquality")
        let chartDataSet = PieChartDataSet(entries: propertiesCount, label: (status as! String))
                       let chartData = PieChartData(dataSet: chartDataSet)
                       let pFormatter = NumberFormatter()
                       pFormatter.numberStyle = .none
                       chartData.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
                       chartView.holeRadiusPercent = 0.40
                        chartDataSet.colors = ChartColorTemplates.material()
                        chartView.data = chartData
        
        if (status == "good"){
            
             chartDataSet.colors = [UIColor(red: 106.0/255, green: 165.0/255, blue: 90.0/255, alpha: 1.0)]
            
        }
       else if (status == "poor"){
                   
                    chartDataSet.colors = [UIColor(red: 231.0/255, green: 159.0/255, blue: 75.0/255, alpha: 1.0)]
                   
               }
        else if (status == "Staisfactory"){
            
             chartDataSet.colors = [UIColor(red: 171.0/255, green: 198.0/255, blue: 100.0/255, alpha: 1.0)]
            
        }
        else if (status == "Moderate"){
                   
                    chartDataSet.colors = [UIColor(red: 252.0/255, green: 244.0/255, blue: 94.0/255, alpha: 1.0)]
                   
               }
        else if (status == "very poor"){
                          
                           chartDataSet.colors = [UIColor(red: 193.0/255, green: 68.0/255, blue: 55.0/255, alpha: 1.0)]
                          
                      }
        else{
            
            chartDataSet.colors = [UIColor(red: 162.0/255, green: 56.0/255, blue: 44.0/255, alpha: 1.0)]
            
        }
        
    }
    
    
    
    
}


