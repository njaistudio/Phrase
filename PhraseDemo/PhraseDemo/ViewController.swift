//
//  ViewController.swift
//  PhraseDemo
//
//  Created by Hau Tu on 9/17/15.
//  Copyright (c) 2015 Suga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mYourName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mTitle.text = Phrase.from("TITLE").description
        
        mYourName.text = Phrase.from("YOUR_NAME")
            .put("yourName", value: "Njai")
            .fomat().description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

