//
//  ViewController.swift
//  AngelsVote(TableView)
//
//  Created by Alper Yorgun on 29.04.2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DataTableViewCell
        cell.lbltext.text = names[indexPath.row]
        cell.imageview.image = UIImage(named: imagenames[indexPath.row])
        return cell
    }
    
    var names : [String] = ["Barbara Palvin","Scarlett Johansson","Jennifer Lawrence","Gigi Hadid","Kristen Stewart","Lea Elui","Madison Beer","Esther Lomb","Alina Boz","Angelina Jolie"]
    var imagenames : [String] = ["barbara","scarlet","lawrance","gigi","Kristen","lea","madison","esther","alina","angelina"]
    var selectedrow : Int = Int()
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "viewtwo", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let infoview = segue.destination as! infoViewController
        selectedrow = table.indexPathForSelectedRow!.row
        infoview.setaciklama(inputstring: names[selectedrow])
        infoview.imagenameinput(inputstring: imagenames[selectedrow])
    }
   


}

