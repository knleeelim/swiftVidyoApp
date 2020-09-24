//
//  ViewController.swift
//  VidyoSwiftSample
//
//  Created by ApiSamples on 07/07/17.
//  Copyright © 2017 ApiSamples. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    //Properties
    //@IBOutlet var Abc: UIView!
    
    var textPortal: String!
    var textRoomKey: String!
    var textDisplayName: String!
    
    @IBOutlet weak var TextJoinCode: UITextField!
    @IBOutlet weak var JoinConfirm: UIButton!
    
    //var m_lib = VidyoLibrary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var border = CALayer()
        border.frame = CGRect(x: 0.0, y: TextJoinCode.frame.height - 1, width: TextJoinCode.frame.width, height: 1.0)
        border.backgroundColor = UIColor.black.cgColor
        TextJoinCode.borderStyle = UITextField.BorderStyle.none
        TextJoinCode.layer.addSublayer(border)
        
        JoinConfirm.backgroundColor = UIColor(red: 0.93, green: 0.36, blue: 0.14, alpha: 1.00)
        JoinConfirm.layer.cornerRadius = 15
        JoinConfirm.layer.borderWidth = 1
        JoinConfirm.layer.borderColor = UIColor(red: 0.93, green: 0.36, blue: 0.14, alpha: 1.00).cgColor
        
        print("loaded")
        
        //print("View Being loaded, whatif second time?")
        //m_lib.initializeVidyo(Abc);
       
        //xx.oi("Abc");
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func JoinClicked(_ sender: UIButton) {
        print("abc")
        textPortal = "http://sol.nownnow.com"
        textRoomKey = "dAefhhOhis"
        textDisplayName = "아이폰앱테스트"
        
        //let joinCode = TextJoinCode.text;
        /*let url = URL(string: "http://www.nownproctor.com/participant/"+joincode)!
        let task = URLSession.shared.dataTask(with: url){(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()*/
        let portal = textPortal;
        let roomKey = textRoomKey;
        let displayName = textDisplayName;
        //m_lib.connect(toRoom: portal, roomKey, displayName);
        
        
    }
    
    
    @IBAction func LeaveClicked(_ sender: UIButton) {
        
        //m_lib.leaveRoom();
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        
    }
}


