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
    var list : [String] = []
    var listAc : [String] = []
    var fileO : URL!
    var selectedrow : Int = -1
    
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        let addbutton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addbuttonaction))
        self.navigationItem.rightBarButtonItem = addbutton
        self.navigationItem.leftBarButtonItem = editButtonItem
        let baseURL = try! FileManager.default.url(for: FileManager.SearchPathDirectory.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        fileO = baseURL.appendingPathComponent("list.txt")
        loadData()
    }
    @objc func addbuttonaction(){
        let alert = UIAlertController(title: "Ekle", message: "Bir not ekleyin", preferredStyle: .alert)
        alert.addTextField { (textfield) in
            textfield.placeholder = "Notu buraya girin"
        }
        let alertadd = UIAlertAction(title: "Ekle", style: UIAlertAction.Style.default) { (action) in
            let girdi = alert.textFields![0]
            print("add works")
            self.notekle(not:girdi.text!)
        }
        let alertcancel = UIAlertAction(title: "İptal", style: .cancel, handler: nil)
        alert.addAction(alertcancel)
        alert.addAction(alertadd)
        present(alert, animated: true, completion: nil)
    }
    func notekle(not : String){
        list.insert(not, at: 0)
        let indexpath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexpath], with: .left)
        saveData()
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        table.setEditing(editing, animated: animated)
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            table.deleteRows(at: [indexPath], with: .left)
            saveData()
        }
    }
    func saveData(){
        let veriler = NSArray(array: list)
        do{
            try veriler.write(to: fileO)
        }catch{
         print("write fail")
        }
        
    }
    func loadData(){
        if let loadedarray = NSArray(contentsOf: fileO) as? [String] {
            list = loadedarray
            table.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "viewacikla", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let aciklamaview = segue.destination as! AciklamalarViewController
        selectedrow = table.indexPathForSelectedRow!.row
        aciklamaview.setaciklama(a: list[selectedrow])
    }
    


}

