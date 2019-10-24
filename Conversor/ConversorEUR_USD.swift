//
//  ConversorEUR_USD.swift
//  Conversor
//
//  Created by Otto Colomina Pardo on 20/10/17.
//  Copyright © 2017 Universidad de Alicante. All rights reserved.
//

import Foundation

class ConversorEUR_USD {
    var unEURenUSD : Float = 0.0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) {
            timer in
            self.actualizarTipo()
        }
    }
    
    func cuantosUSDson(eur:Float)->Float {
        return eur*self.unEURenUSD
    }
    
    func cuantosEURson(usd:Float)->Float {
        return usd/self.unEURenUSD
    }
    
    func actualizarTipo() {
        //Esto se debería consultar a algún servidor.
        //Lo simulamos con un valor aleatorio
        self.unEURenUSD = Float((100.0+Double(arc4random()%50))/100.0);
        self.sendNotification(change: self.unEURenUSD)
        print("Cambio actual: \(self.unEURenUSD)");
    }
    
    func sendNotification(change: Float) {
        let nc = NotificationCenter.default
        nc.post(name: NSNotification.Name("conversion"), object: nil, userInfo: ["change":change])
    }
}
