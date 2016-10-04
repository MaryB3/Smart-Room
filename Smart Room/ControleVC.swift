//
//  ControleVC.swift
//  Smart Room
//
//  Created by Mary Béds on 03/10/16.
//  Copyright © 2016 Maria Eugênia Teixeira. All rights reserved.
//

import UIKit

class ControleVC: UIViewController {

    
    @IBOutlet var backgroundImg: UIImageView!
    @IBOutlet var arCondicionadoView: UIView!
    
    @IBOutlet var temperaturaLbl: UILabel!
    @IBOutlet var powerAirBtn: UIButton!
    
    var isArCondicionado: Bool!
    var valorTemperatura: Int!
    
    var arCondiconadoOn: Bool!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        if let arCondicionado = defaults.string(forKey: "arLigado") {
            if arCondicionado == "1" {
                arCondiconadoOn = true
            } else{
                arCondiconadoOn = false
            }
        }else{
            arCondiconadoOn = false
        }
        
        isArCondicionado = false
        valorTemperatura = 16
        
        ajustarImagens()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ajustarImagens(){
        
        if arCondiconadoOn == true {
            powerAirBtn.setImage(UIImage(named: "powerOn"), for: .normal)
            
        } else {
            powerAirBtn.setImage(UIImage(named: "powerOff"), for: .normal)
        }
    }

    // MARK: - BOTÃO AR CONDICIONADO
    @IBAction func arCondicionadoPressed(_ sender: UIButton) {
        
        if isArCondicionado == false {
            
            isArCondicionado = true
            arCondicionadoView.isHidden = false
            backgroundImg.frame = CGRect(x: backgroundImg.frame.origin.x, y: backgroundImg.frame.origin.y, width: backgroundImg.frame.size.width, height: backgroundImg.frame.size.height + 190)
            sender.setImage(UIImage(named:"bt_setaParaCima"), for: .normal)
            
        } else{
            
            isArCondicionado = false
            arCondicionadoView.isHidden = true
            backgroundImg.frame = CGRect(x: backgroundImg.frame.origin.x, y: backgroundImg.frame.origin.y, width: backgroundImg.frame.size.width, height: backgroundImg.frame.size.height - 190)
            sender.setImage(UIImage(named:"bt_setaParaBaixo"), for: .normal)
            
        }
    }
   
    //MARK: - LIGAR/DESLIGAR AR
    @IBAction func powerAirPressed(_ sender: UIButton) {
        
         let defaults = UserDefaults.standard
        
        if arCondiconadoOn == true {
            powerAirBtn.setImage(UIImage(named: "powerOff"), for: .normal)
            arCondiconadoOn = false
            defaults.set("0", forKey: "arLigado")
            
        } else {
            powerAirBtn.setImage(UIImage(named: "powerOn"), for: .normal)
            arCondiconadoOn = true
            defaults.set("1", forKey: "arLigado")
        }
    }

    
    //MARK: - BOTÕES AUMENTAR/DIMINUIR TEMPERATURA
    
    @IBAction func aumentarTempPressed(_ sender: AnyObject) {
        
        if valorTemperatura < 33 {
            valorTemperatura = valorTemperatura + 1
            temperaturaLbl.text = "\(valorTemperatura!)˚"
            
        } else {
            
            let alert = UIAlertController(title: "Alerta", message: "Você já atingiu a temperatura máxima.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        
    }
    
    @IBAction func diminuirTempPressed(_ sender: AnyObject) {
        
        if valorTemperatura > 15 {
            valorTemperatura = valorTemperatura - 1
            temperaturaLbl.text = "\(valorTemperatura!)˚"
            
        } else{
            
            let alert = UIAlertController(title: "Alerta", message: "Você já atingiu a temperatura mínima.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    

}
