//
//  BooksViewController.swift
//  Library
//
//  Created by luk dro on 3/6/17.
//  Copyright © 2017 luk dro. All rights reserved.
//

import UIKit


class BooksViewController: UITableViewController {
    var author :[String : AnyObject]!
    let CellIdentifier = "Cell Identifier"
    var books : [AnyObject]{
        get {
            if let books = author["Books"] as? [AnyObject]
            {
                return books
            }
            else{
                return [AnyObject]()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Books"

        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: CellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "coverBook"
        {
            if let indexPath = tableView.indexPathForSelectedRow,let book = books[indexPath.row] as? [String : String] {
                let destinationViewController = segue.destination as? BooksCoverViewController
                destinationViewController?.book = book
            }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        if let book = books[indexPath.row] as? [String:String], let title = book["Title"]
        {
            cell.textLabel?.text = title
        }

        // Configure the cell...

        return cell
    }
  

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "coverBook", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
