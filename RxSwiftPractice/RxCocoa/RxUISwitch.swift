//
//  RxUISwitch.swift
//  RxSwiftPractice
//
//  Created by 장예지 on 7/30/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class RxUISwitch: ViewController {
    
    private let simpleSwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(simpleSwitch)
        simpleSwitch.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
        }
        
        setSwitch()
    }
    
    private func setSwitch(){
        Observable.of(false)
            .bind(to: simpleSwitch.rx.isOn)
            .disposed(by: disposeBag)
    }
}
