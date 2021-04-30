//
//  infoViewController.swift
//  AngelsVote(TableView)
//
//  Created by Alper Yorgun on 30.04.2021.
//

import UIKit

class infoViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var labeltext: UILabel!
    var aciklamastring = ""
    var imagenamestring = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        labeltext.text = "Your angel is -->\(aciklamastring)"
        imageview.image = UIImage(named: imagenamestring)
        // Do any additional setup after loading the view.
    }
    func setaciklama(inputstring : String){
        aciklamastring = inputstring
    }
    func imagenameinput(inputstring : String){
        imagenamestring = inputstring
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func voteaction(_ sender: UIButton) {
        let alert = UIAlertController(title: "EXCELLENT CHOICE", message: "\(aciklamastring)", preferredStyle: .alert)
        let alertok = UIAlertAction(title: "Ok", style: .cancel, handler: .none)
        alert.addAction(alertok)
        present(alert, animated: true, completion: nil)
    }
}
