//
//  RxOf.swift
//  RxSwiftPractice
//
//  Created by 장예지 on 7/30/24.
//

import UIKit
import RxSwift

//of: 여러가지 값을 동시에 전달
final class RxOf: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        testOf()
    }
    
    func testOf(){
        let itemA = [3.3, 4.0, 5.3, 3.7]
        let itemB = [2.2, 3.6, 4.7, 8.8]
        
        Observable.of(itemA, itemB)
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
