//
//  ViewController.swift
//  IosNotes
//
//  Created by Daniel Salib on 2017-08-07.
//  Copyright © 2017 Daniel Salib. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    var data:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Notes"
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationItem.leftBarButtonItem = editButtonItem()
        load()
    }
    
    func addNote() {
        let name:String = "Row \(data.count + 1)"
        data.insert(name, atIndex : 0)
        let indexPath:NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        table.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        save()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        table.setEditing(editing, animated: animated)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        data.removeAtIndex(indexPath.row)
        table.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        save()
    }
    
    func save(){
        NSUserDefaults.standardUserDefaults().setValue(data, forKey: "notes")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func load(){
        if let loadedData = NSUserDefaults.standardUserDefaults().valueForKey("notes") as? [String]{
            data = loadedData
            table.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

