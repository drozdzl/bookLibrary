//
//  AuthorsViewController.swift
//  Library
//
//  Created by luk dro on 3/6/17.
//  Copyright © 2017 luk dro. All rights reserved.
//

import UIKit

class AuthorsViewController: UITableViewController {
    let cellIdentifier = "Cell Identifier"
    let segueId = "BooksViewController"
    var authors = [AnyObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Authors"
        let filePath = Bundle.main.path(forResource: "Books",ofType : "plist")
        if let path = filePath{
            authors = NSArray(contentsOfFile: path )! as [AnyObject]
            print(authors)
        }
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueId
        {
            if let indexPath = tableView.indexPathForSelectedRow,let author = authors[indexPath.row] as? [String: AnyObject]{
                let destinationViewController = segue.destination as! BooksViewController
                destinationViewController.author = author
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return authors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        if let author = authors[indexPath.row] as? [String: AnyObject],let name = author["Author"] as? String
        {
            cell.textLabel?.text = name
        }

        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Perform Segue
        performSegue(withIdentifier: segueId, sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
