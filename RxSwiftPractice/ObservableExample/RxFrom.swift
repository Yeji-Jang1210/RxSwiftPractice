//
//  RxFrom.swift
//  RxSwiftPractice
//
//  Created by 장예지 on 7/30/24.
//

import UIKit
import RxSwift

final class RxFrom: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        testFrom()
    }
    
    func testFrom(){
        let itemA = [3.3, 4.0, 5.3, 3.7]
        
        Observable.from(itemA)
            .subscribe { arr in
                print("from - \(arr)")
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
