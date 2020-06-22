//
//  HeroViewController.swift
//  SuperHeroes
//
//  Created by SBI Admin on 2020/06/22.
//  Copyright © 2020 Rhulani Ndhlovu. All rights reserved.
//

import UIKit
import SwiftCharts
import SnapKit

class SuperheroViewController: ViewController {

    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var alighnment: UILabel!
    @IBOutlet weak var placeOfBirth: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var chartContainerView: UIView!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var name: UILabel!
    
    
    
    var hero: Superhero?
        var chart: BarsChart!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.createPanGestureRecognizer()
            
            
            // Do any additional setup after loading the view.
    
            if let hero = self.hero {
                
                self.alighnment.text = hero.biography?.alignment
                self.fullName.text = hero.biography?.fullName
                 
                self.heroImageView.kf.setImage(with: URL(string: hero.imageURL))
                
                self.name.text = hero.name
                self.placeOfBirth.text = hero.biography?.placeOfBirth
                self.publisher.text = hero.biography?.publisher
                
            }
            
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            /*
            let application = UIApplication.shared.delegate as! AppDelegate
            let navController = application.window?.rootViewController as! UINavigationController
            let selectedIndex = navController.selectedIndex */
            
            setupChart()
        }
        
        
        // MARK: - Helpers
   
        func createPanGestureRecognizer() {
            let panGesture = UIPanGestureRecognizer(target: self, action:#selector(self.panGestureRecognizerHandler))
            self.view.addGestureRecognizer(panGesture)
        }
     
        
        func setupChart(){
            guard let powerstats = self.hero?.powerstats else { return }
            let guidelinesConfig = GuidelinesConfig(dotted: false, lineWidth: 0.0, lineColor: .clear)
            
            let chartConfig = BarsChartConfig(
                valsAxisConfig: ChartAxisConfig(from: 0, to: 100, by: 20),
                guidelinesConfig: guidelinesConfig
            )

            let chart = BarsChart(
                frame: self.chartContainerView.bounds,
                chartConfig: chartConfig,
                xTitle: "",
                yTitle: "",
                bars: [
                    ("Combat", (powerstats.combat as NSString).doubleValue),
                    ("Durability", (powerstats.durability as NSString).doubleValue),
                    ("Intelligence", (powerstats.intelligence as NSString).doubleValue),
                    ("Power", (powerstats.power as NSString).doubleValue),
                    ("Strength", (powerstats.strength as NSString).doubleValue),
                    ("Speed", (powerstats.speed as NSString).doubleValue)
                ],
                color: UIColor.darkGray,
                barWidth: 30,
                horizontal: true
            )
            self.chart = chart
            self.chartContainerView.addSubview(self.chart.view)
            self.setupConstraints()
        }
        
        func setupConstraints(){
            self.chartContainerView.translatesAutoresizingMaskIntoConstraints = false
            self.chart.view.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(0)
                make.left.equalToSuperview().offset(0)
                make.right.equalToSuperview().offset(-10)
                make.top.equalToSuperview().offset(15)
            }
        }
        
    }
