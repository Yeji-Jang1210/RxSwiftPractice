//
//  RxTake.swift
//  RxSwiftPractice
//
//  Created by 장예지 on 7/30/24.
//

import UIKit
import RxSwift

//take: 방출된 아이템 중 n개의 아이템을 내보냄
final class RxTake: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        testTake()
    }
    
    func testTake(){

        Observable
            .repeatElement("yeji")
            .take(5)
            .subscribe { arr in
                print("of - \(arr)")
            } onError: { error in
                print(error)
            } onCompleted: {
                print("completed")
            } onDisposed: {
                print("disposed")
            }
            .disposed(by: disposeBag)

    }
}
