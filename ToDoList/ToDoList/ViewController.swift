//
//  ViewController.swift
//  ToDoList
//
//  Created by Alper Yorgun on 26.04.2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    var list : [String] = ["Ekmek al.","Çöpü çıkar.","Faturaları öde."]
    

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        let addbutton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addbuttonaction))
        self.navigationItem.rightBarButtonItem = addbutton
    }
    @objc func addbuttonaction(){
        
    }


}

