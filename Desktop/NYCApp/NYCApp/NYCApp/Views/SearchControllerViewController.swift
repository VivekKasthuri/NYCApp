//
//  SearchControllerViewController.swift
//  NYCApp
//
//  Created by Vivekvardhan Kasthuri on 02/07/19.
//  Copyright © 2019 Vivekvardhan Kasthuri. All rights reserved.
//

import UIKit

class SearchControllerViewController: UIViewController {

    @IBOutlet weak var searchTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Search"
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    

    @IBAction func searchResults(_ sender: Any) {
        
        DispatchQueue.main.async {
         NetworkHandler().getSearchArticles(path: self.searchTxt.text!) { (result, flag) in
            
            if flag {
            
             let articles = JSONparser().parseJson(json: result as! NSDictionary)
                
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
             guard let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "articleView") as? ArticleTableViewController else { return  }
                vc.articles = articles
             self.navigationController?.pushViewController(vc, animated: true)
         }
        }
     }
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
