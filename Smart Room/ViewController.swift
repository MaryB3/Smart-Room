//
//  ViewController.swift
//  Smart Room
//
//  Created by Mary Béds on 03/10/16.
//  Copyright © 2016 Maria Eugênia Teixeira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var openDoorBtn: UIButton!
    @IBOutlet var turnLightBtn: UIButton!
    @IBOutlet var turnAirBtn: UIButton!
    
    
    var doorOpened: Bool!
    var lightOn: Bool!
    var airOn: Bool!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       verificarDefaults()
        
        ajustarImagens()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func verificarDefaults(){
        
        //let defaults = UserDefaults.standard

        if let portaAberta = defaults.string(forKey: "portaAberta") {
            if portaAberta == "1" {
                doorOpened = true
            } else {
                doorOpened = false
            }
            
        } else {
            doorOpened = false
        }
        
        if let arCondicionado = defaults.string(forKey: "arLigado") {
            print(arCondicionado)
            if arCondicionado == "1" {
                airOn = true
            } else {
                airOn = false
            }
            
        } else {
            airOn = false
        }
        
        if let luzAcesa = defaults.string(forKey: "luzAcesa") {

            if luzAcesa == "1" {
                lightOn = true
            } else {
                lightOn = false
            }
            
        } else {
            lightOn = false
        }

    }
    
    func ajustarImagens(){
        
        if doorOpened == true {
            openDoorBtn.setImage(UIImage(named: "img_aberto"), for: .normal)
        }
        
        if airOn == true {
            turnAirBtn.setImage(UIImage(named:"img_arCondionadoON"), for: .normal)
        }
        
        if lightOn == true {
            turnLightBtn.setImage((UIImage(named: "img_luzAcesa")), for: .normal)
        }
    }


    //MARK: - BOTÕES MENU
    @IBAction func openDoorPressed(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        if doorOpened == false {
            
            sender.setImage(UIImage(named: "img_aberto"), for: .normal)
            doorOpened = true
            defaults.set("1", forKey: "portaAberta")
            
        } else{
            
            sender.setImage(UIImage(named: "img_fechado"), for: .normal)
            doorOpened = false
            defaults.set("0", forKey: "portaAberta")
        }
    
    }
    
    @IBAction func turnLightPressed(_ sender: UIButton) {
        
        if lightOn == false {
            
            sender.setImage(UIImage(named: "img_luzAcesa"), for: .normal)
            lightOn = true
            defaults.set("1", forKey: "luzAcesa")
        } else{
            
            sender.setImage(UIImage(named: "img_luzApagada"), for: .normal)
            lightOn = false
             defaults.set("0", forKey: "luzAcesa")
        }
        
    }
    
    @IBAction func turnAirPressed(_ sender: UIButton) {
        
        //let defaults = UserDefaults.standard
        
        if airOn == false {
            sender.setImage(UIImage(named: "img_arCondionadoON"), for: .normal)
            airOn = true
            defaults.set("1", forKey: "arLigado")

            
        } else{
            sender.setImage(UIImage(named: "img_arCondicionadoOFF"), for: .normal)
            airOn = false
            defaults.set("0", forKey: "arLigado")
        }
        
    }
    
    @IBAction func countStudentsPressed(_ sender: UIButton) {
    }
    
    
  }

