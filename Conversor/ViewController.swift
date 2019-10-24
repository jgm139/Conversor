//
//  ViewController.swift
//  Conversor
//
//  Created by Otto Colomina Pardo on 20/10/17.
//  Copyright © 2017 Universidad de Alicante. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let conversor = ConversorEUR_USD()

    @IBOutlet weak var dolares: UITextField!
    @IBOutlet weak var euros: UITextField!
    
    @IBOutlet weak var tipoCambioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.subscribeConversorEUR_USD()
    }
    
    func subscribeConversorEUR_USD() {
        let nc = NotificationCenter.default
        nc.addObserver(self, selector:#selector(self.receive), name:NSNotification.Name("conversion"), object: nil)
    }
    
    @objc func receive(notificacion:Notification) {
        if let userInfo = notificacion.userInfo {
            let conver = userInfo["change"] as! Float
            self.tipoCambioLabel.text = "1€ = " + String(conver)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func calcularUSDPulsado(_ sender: Any) {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        if let numEuros = nf.number(from: self.euros.text!) {
            let euros = Float(truncating:numEuros)
            let dolares = conversor.cuantosUSDson(eur: euros)
            self.dolares.text = String(dolares)
        }
    }
    
   
    @IBAction func calcularEURPulsado(_ sender: Any) {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        if let numDolares = nf.number(from: self.dolares.text!) {
            let dolares = Float(truncating:numDolares)
            let euros = conversor.cuantosEURson(usd: dolares)
            self.euros.text = String(euros)
        }
    }
}

