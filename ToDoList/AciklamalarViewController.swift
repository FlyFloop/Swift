//
//  AciklamalarViewController.swift
//  ToDoList
//
//  Created by Alper Yorgun on 26.04.2021.
//

import UIKit

class AciklamalarViewController: UIViewController {

    @IBOutlet weak var textview: UITextView!
    var masterview : ViewController?
    var text : String!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textview.text = text
    }
    func setaciklama(a : String){
    text = a
    }
    override func viewWillDisappear(_ animated: Bool) {
        masterview?.aciklama = textview.text
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
