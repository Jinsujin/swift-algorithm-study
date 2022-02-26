//
//  5464_주차장.swift
//  Algorithm_study
//
//  Created by dale on 2022/02/20.
//

import Foundation

func p5464() {
    let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
    let N = input[0]
    let M = input[1]
    var parkingLot = Array(repeating: 0, count: N)
    var parkingFee : [Int] = []
    var carWeights : [Int] = []
    var totalFee = 0
    var waiting : [Int] = []
    for _ in 0..<N {
        parkingFee.append(Int(readLine()!)!)
    }
    for _ in 0..<M {
        carWeights.append(Int(readLine()!)!)
    }
    for _ in 0..<(M*2){
        var car = Int(readLine()!)!
        if car > 0 {
            if !((parkingLot.filter{$0 == 0}).count == 0) {
                let index = parkingLot.firstIndex(of: 0)!
                parkingLot[index] = car
            }else{
                waiting.append(car)
            }
        }else{
            car = Int(car.magnitude)
            let index = parkingLot.firstIndex(of: car)!
            parkingLot[index] = 0
            totalFee += carWeights[car-1] * parkingFee[index]
            if !waiting.isEmpty {
                parkingLot[index] = carWeights[waiting.removeFirst()-1]
            }
        }
    }
    print(totalFee)
}




