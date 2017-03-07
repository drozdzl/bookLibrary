//
//  BooksCoverViewController.swift
//  Library
//
//  Created by luk dro on 3/7/17.
//  Copyright © 2017 luk dro. All rights reserved.
//

import UIKit

class BooksCoverViewController: UIViewController {

    @IBOutlet weak var CoverBookImageView: UIImageView!
    var book :[String : String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let fileName = book["Cover"] {
            CoverBookImageView.image = UIImage(named: fileName)
            CoverBookImageView.contentMode = .scaleAspectFit
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
