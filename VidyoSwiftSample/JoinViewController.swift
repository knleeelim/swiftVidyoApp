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
    
    @IBOutlet weak var nameText: UILabel!
    var m_lib = VidyoLibrary()
    var joinCode : String = "no joinCode";
    var name: String = "no name";
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if(!m_lib.vidyoClientStarted()){
            print("This should not be printed if vidyoclient initialized already")
            m_lib.initializeVidyo(theView);

        }
        print(self.joinCode)
        print(self.name)
        nameText.text = "\(name)님\n 방에 입장해주세요"
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillTerminate(notification:)), name: NSNotification.Name.UIApplicationWillTerminate, object: nil)

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
        m_lib.setParticipantsLimit()
        m_lib.connect(toRoom: "http://sol.nownnow.com", joinCode, name);
        
        
    }
    
    
    @IBAction func LeaveClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindtoCode", sender: self)
        //dismiss(animated: true, completion: nil)
        //m_lib.leaveRoom();
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("disappearing")
        m_lib.applicationWillTerminate(UIApplication.shared)
    }
    
    @objc func applicationWillTerminate(notification: Notification){
        print("gets terminated completely")
        if(m_lib.vidyoClientStarted()){
            m_lib.applicationWillTerminate(UIApplication.shared)
            
        }
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("something deinitted")
    }

}
