//
//  ViewController.swift
//  exerciseNoteApp
//
//  Created by HoangDucAnh on 10/01/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // Outlet
    @IBOutlet weak var noteListTable: UITableView!
    
    // Variable
    static var noteList = [note]()
    static var indexNote = 0
    static var typeSave = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteListTable.delegate = self
        noteListTable.dataSource = self
    }
    
    @IBAction func addNote(_ sender: UIButton) {
        self.performSegue(withIdentifier: "GoToNote", sender: self)
        ViewController.typeSave = "ADD"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellNote") as UITableViewCell?
        cell?.textLabel?.text = ViewController.noteList[indexPath.row].title
        return cell!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.noteList.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        ViewController.indexNote = indexPath.row
        ViewController.typeSave = "EDIT"
        self.performSegue(withIdentifier: "GoToNote", sender: self)
    }

}

