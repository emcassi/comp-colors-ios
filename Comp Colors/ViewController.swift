//
//  ViewController.swift
//  Comp Colors
//
//  Created by Alex Wayne on 11/9/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView1: ColorView!
    @IBOutlet weak var colorView2: ColorView!
    @IBOutlet weak var colorView3: ColorView!
    @IBOutlet weak var colorView4: ColorView!
    
    var currentColors: [ColorData] = []
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emptyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 
    
    @IBAction func newSwatchTapped(_ sender: UIButton) {
        getNewSwatch()
        
    }
    
    func getNewSwatch(){
        performRequest()
    }
    
    func performRequest(){
        let startingColor = getRandomColor()
        if let startingColorComps = startingColor.cgColor.components {
            
            let modes = ["analogic", "analogic-complement", "quad"]
            
            let modeIndex = Int.random(in: 0...2)
            
            if let url = URL(string: "https://www.thecolorapi.com/scheme?rgb=(\(startingColorComps[0]),\(startingColorComps[1]),\(startingColorComps[2])&format=json&mode=\(modes[modeIndex])&count=4") {
                let session = URLSession(configuration: .default)
                
                let task = session.dataTask(with: url) { data, response, error in
                    if let error = error {
                        print(error)
                        return
                    }
                    
                    if let data = data {
                        self.parseJSON(data: data)
                    }
                }
                task.resume()
            } else {
                print("Cannot form url")
            }
        }
    }
    
    func parseJSON(data: Data){
      let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ColorsData.self, from: data)
            currentColors = decodedData.colors
            
            DispatchQueue.main.async {
                if !self.emptyLabel.isHidden {
                    self.emptyLabel.isHidden = true
                }
                self.colorView1.backgroundColor = UIColor(red: CGFloat(self.currentColors[0].rgb.r) / 255, green: CGFloat(self.currentColors[0].rgb.g) / 255, blue: CGFloat(self.currentColors[0].rgb.b) / 255, alpha: 1)
                self.colorView2.backgroundColor = UIColor(red: CGFloat(self.currentColors[1].rgb.r) / 255, green: CGFloat(self.currentColors[1].rgb.g) / 255, blue: CGFloat(self.currentColors[1].rgb.b) / 255, alpha: 1)
                self.colorView3.backgroundColor = UIColor(red: CGFloat(self.currentColors[2].rgb.r) / 255, green: CGFloat(self.currentColors[2].rgb.g) / 255, blue: CGFloat(self.currentColors[2].rgb.b) / 255, alpha: 1)
                self.colorView4.backgroundColor = UIColor(red: CGFloat(self.currentColors[3].rgb.r) / 255, green: CGFloat(self.currentColors[3].rgb.g) / 255, blue: CGFloat(self.currentColors[3].rgb.b) / 255, alpha: 1)
                
                self.colorView1.rgbLabel.text = self.currentColors[0].rgb.value
                self.colorView2.rgbLabel.text = self.currentColors[1].rgb.value
                self.colorView3.rgbLabel.text = self.currentColors[2].rgb.value
                self.colorView4.rgbLabel.text = self.currentColors[3].rgb.value
                
                self.colorView1.hexLabel.text = self.currentColors[0].hex.value
                self.colorView2.hexLabel.text = self.currentColors[1].hex.value
                self.colorView3.hexLabel.text = self.currentColors[2].hex.value
                self.colorView4.hexLabel.text = self.currentColors[3].hex.value
            }
        } catch {
            print(error)
        }
    }
    
    func getRandomColor() -> UIColor {
        let color: UIColor
        var rgb: [CGFloat] = [0, 0, 0]
        
        for i in 0...2 {
            rgb[i] = CGFloat.random(in: 0...1)
        }
        color = UIColor(red: rgb[0], green: rgb[1], blue: rgb[2], alpha: 1)
        return color
    }


}

