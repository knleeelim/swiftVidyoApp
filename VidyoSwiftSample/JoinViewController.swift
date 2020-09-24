//
//  JoinViewController.swift
//  VidyoSwiftSample
//
//  Created by Kyung Neung Lee on 2020-09-09.
//  Copyright © 2020 Vidyo. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {
    
    @IBOutlet var theView: UIView!
    
    var m_lib = VidyoLibrary()

    override func viewDidLoad() {
        super.viewDidLoad()
        if(!m_lib.vidyoClientStarted()){
            print("This should not be printed if vidyoclient initialized already")
            m_lib.initializeVidyo(theView);

        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func JoinClicked(_ sender: UIButton) {
        print("abc")

        
        //let joinCode = TextJoinCode.text;
        /*let url = URL(string: "http://www.nownproctor.com/participant/"+joincode)!
        let task = URLSession.shared.dataTask(with: url){(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()*/
        m_lib.connect(toRoom: "http://sol.nownnow.com", "dAefhhOhis", "아이폰앱테스트");
        
        
    }
    
    
    @IBAction func LeaveClicked(_ sender: UIButton) {
        m_lib.applicationWillTerminate(UIApplication.shared)
        performSegue(withIdentifier: "unwindtoCode", sender: self)
        //dismiss(animated: true, completion: nil)
        //m_lib.leaveRoom();
    }
    


}
