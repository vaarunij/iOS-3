//
//  tableViewController.swift
//  Ritu Shikha
//
//  Created by Ritu Shikha on 28/03/2018.
//  Copyright © 2018 epita. All rights reserved.
//

import UIKit

class tableViewController: UITableViewController {
    
    @IBOutlet var myTableView2: UITableView!
    
    var mealArray : [Meal] = []
    
    var clickedIndex : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hard coded meals
        
        let meal1 = Meal(title: "Victoria Falls", category:"Zimbabwe/Zambia", description: "Victoria Falls that border Zambia and Zimbabwe is the largest waterfall in the world by total area. The falls transport an astonishing 1,088 cubic meters per second of water down an ~350-foot cliff.", imageName: "Tracy.jpg")
        
        let meal2 = Meal(title: "Amazon River", category:"Brazil", description: "The Amazon River is the artery for the largest rainforest in the world. It is the largest river in the world by discharge and one of the largest by length. The surrounding rainforest represents over half of the world's remaining rainforest.", imageName: "Machu.jpg")
        
        let meal3 = Meal(title: "Rainbow Mountains of Zhangye Danxia", category:"China", description: "The Rainbow Mountains of Zhangye Danxia, China show off weathering and erosion at its most beautiful. The dramatic colors throughout the mountain are a result of trace minerals associated within the sandstone, coloring the sand in reds, greens, and yellows.", imageName: "Bison.jpg")
        
        let meal4 = Meal(title: "Neuschwanstein Castle", category:"Germany", description: "Neuschwanstein, a nineteenth-century castle in southern Germany is the inspiration for Disneyland's Sleeping Beauty Castle. This German retreat is visited regularly during summer months as a symbol of refuge and peace.", imageName: "meal4.jpg")
        
        let meal5 = Meal(title: "Northern Lights", category:"Iceland", description: "The natural display of varying color within the arctic sky is one of Iceland's biggest tourist sights. Unfortunately, it's rather unpredictable so make sure you leave enough time to try a few times.", imageName: "meal5.jpg")
        
        let meal6 = Meal(title: "Cake", category:"Dessert", description: "Cake is a form of sweet dessert that is typically baked. In its oldest forms, cakes were modifications of breads, but cakes now cover a wide range of preparations that can be simple or elaborate, and that share features with other desserts such as pastries, meringues, custards, and pies.", imageName: "meal6.jpg")
        
        
        // fill the array
        
        mealArray.append(meal1)
        mealArray.append(meal2)
        mealArray.append(meal3)
        mealArray.append(meal4)
        mealArray.append(meal5)
        mealArray.append(meal6)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell

        // stroke effect
        let strokeTextAttributes: [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.strokeColor : UIColor.black,
            NSAttributedStringKey.foregroundColor : UIColor.white,
            NSAttributedStringKey.strokeWidth : -4.0,
            ]
        
        // bold effect
        cell.titleLbl?.font = UIFont.boldSystemFont(ofSize: 30.0)
        cell.categoryLbl?.font = UIFont.boldSystemFont(ofSize: 25.0)
        
        // set attributes
        cell.titleLbl?.attributedText = NSAttributedString(string: mealArray[indexPath.row].title! ,attributes: strokeTextAttributes)
        cell.categoryLbl?.attributedText = NSAttributedString(string: mealArray[indexPath.row].category!, attributes: strokeTextAttributes)
        cell.bgImageView.image = UIImage(named: mealArray[indexPath.row].imageName!)
        
        // set cell border and shadow
        cell.layer.masksToBounds = true
       // cell.layer.cornerRadius = 40
        cell.layer.borderWidth = 5
        cell.layer.shadowOffset = CGSize(width: -1, height: 1)
        let borderColor: UIColor = .white
        cell.layer.borderColor = borderColor.cgColor
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickedIndex = indexPath
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! detailViewController
        
        detailVC.meal = mealArray[clickedIndex!.row]
    }

}

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    
}
