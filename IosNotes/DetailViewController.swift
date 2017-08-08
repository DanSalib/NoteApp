//
//  DetailViewController.swift
//  IosNotes
//
//  Created by Daniel Salib on 2017-08-07.
//  Copyright © 2017 Daniel Salib. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var text = ""
    var masterView:ViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = text
        textView.becomeFirstResponder()
    }
    
    func setNoteText(note : String){
        text = note;
        if isViewLoaded(){
            textView.text = note
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        masterView.newRowText = textView.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
