//
//  NoteViewController.swift
//  exerciseNoteApp
//
//  Created by HoangDucAnh on 10/01/2023.
//

import UIKit

class NoteViewController: UIViewController {
    // Outlet
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var contentLabel: UITextView!
    
    // Variable
    var indexNote = ViewController.indexNote
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if ViewController.typeSave == "EDIT"{
            titleLabel.text = ViewController.noteList[indexNote].title
            contentLabel.text = ViewController.noteList[indexNote].content
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        ViewController.typeSave = ""
        self.dismiss(animated: true)
    }
    @IBAction func savePressed(_ sender: UIButton) {
        if titleLabel.text == "" || contentLabel.text == ""{
            let alert: UIAlertController = UIAlertController(title: "Notification", message: "Title or content is blank, please fill in to save", preferredStyle: UIAlertController.Style.alert)
            let btnOK: UIAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(btnOK)
            present(alert, animated: true, completion: nil)
        } else if ViewController.typeSave == "ADD" {
            let a = note(title: titleLabel.text ?? "", content: contentLabel.text ?? "")
            ViewController.noteList.append(a)
            self.performSegue(withIdentifier: "SaveSergue", sender: self)
        } else {
            ViewController.noteList[indexNote].title = titleLabel.text ?? ""
            ViewController.noteList[indexNote].content = contentLabel.text ?? ""
            self.performSegue(withIdentifier: "SaveSergue", sender: self)
        }
        
        
        
    }
    
}
