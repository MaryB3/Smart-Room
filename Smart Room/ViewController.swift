//
//  ViewController.swift
//  Smart Room
//
//  Created by Mary Béds on 03/10/16.
//  Copyright © 2016 Maria Eugênia Teixeira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var doorOpened: Bool!
    var lightOn: Bool!
    var airOn: Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        doorOpened = false
        lightOn = false
        airOn = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: - BOTÕES MENU
    @IBAction func openDoorPressed(_ sender: UIButton) {
        
        if doorOpened == false {
            
            sender.setImage(UIImage(named: "img_aberto"), for: .normal)
            doorOpened = true
            
        } else{
            
            sender.setImage(UIImage(named: "img_fechado"), for: .normal)
            doorOpened = false
        }
    
    }
    
    @IBAction func turnLightPressed(_ sender: UIButton) {
        
        if lightOn == false {
            
            sender.setImage(UIImage(named: "img_luzAcesa"), for: .normal)
            lightOn = true
            
        } else{
            
            sender.setImage(UIImage(named: "img_luzApagada"), for: .normal)
            lightOn = false
        }

    }
    
    @IBAction func turnAirPressed(_ sender: UIButton) {
        
        if airOn == false {
            
            sender.setImage(UIImage(named: "img_arCondionadoON"), for: .normal)
            airOn = true
            
        } else{
            
            sender.setImage(UIImage(named: "img_arCondicionadoOFF"), for: .normal)
            airOn = false
        }
    }
    @IBAction func countStudentsPressed(_ sender: UIButton) {
    }
    
    
  }

