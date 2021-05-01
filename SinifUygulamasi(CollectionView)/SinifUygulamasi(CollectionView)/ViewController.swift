//
//  ViewController.swift
//  SinifUygulamasi(CollectionView)
//
//  Created by Alper Yorgun on 30.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ogrencinumara: UILabel!
    @IBOutlet weak var ogrenciad: UILabel!
    var adS : String = String()
    var numaraS : String = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Öğrenci Detayları"
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ogrenciad.text = adS
        ogrencinumara.text = numaraS
        
    }
    func setAdNumara(ad:String,numara:String){
        adS = ad
        numaraS = numara
    }


}

