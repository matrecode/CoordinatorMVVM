//
//  CreditCardViewModel.swift
//  CoordinatorPatternMVVM
//
//  Created by Matre Akshay Dilansing on 02/06/24.
//

import Foundation
import Combine

class CreditCardViewModel : ObservableObject {
    @Published var cardNumber : String = "1234 5678 9012 3456"
    @Published var cardHolderName : String = "AKSHAY DILANSING MATRE"
    @Published var cvv : String? = "141"
    @Published var expiryDate : String = "02/28"
    @Published var isCvvVisible:Bool = false
    private var timer:AnyCancellable?
    @Published var remainingTime: Int = 60
    
    func isValid() -> Bool{
        return !cardNumber.isEmpty && !cardHolderName.isEmpty && !expiryDate.isEmpty
    }
    
    func toggleCvvVisibility(){
        isCvvVisible.toggle()
        if isCvvVisible {
            startTimer()
        }else{
            stopTimer()
        }
    }
    
    private func startTimer(){
        remainingTime = 60
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink{ [weak self] _ in
                self?.remainingTime -= 1
                if self?.remainingTime == 0{
                    self?.isCvvVisible = false
                    self?.stopTimer()
                    
                }
                
            }
        
    }
    
    private func stopTimer(){
        timer?.cancel()
        timer = nil
    }
    
}
