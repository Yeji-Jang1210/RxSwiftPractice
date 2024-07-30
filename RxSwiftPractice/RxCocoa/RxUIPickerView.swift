//
//  RxUIPickerView.swift
//  RxSwiftPractice
//
//  Created by 장예지 on 7/30/24.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class RxUIPickerView: ViewController {
    
    private let simplePickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(simplePickerView)
        view.addSubview(simpleLabel)
        
        simplePickerView.snp.makeConstraints { make in
            make.center.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        setPickerView()
        
    }
    
    func setPickerView(){
        let items = Observable.just([
            "영화",
            "애니메이션",
            "드라마",
            "기타"
        ])
        
        items
            .bind(to: simplePickerView.rx.itemTitles){ (row, element) in
                return element
            }
            .disposed(by: disposeBag)
        
        simplePickerView.rx.modelSelected(String.self)
            .map{ $0.description }
            .bind(to: simpleLabel.rx.text)
            .disposed(by: disposeBag)
        
        
    }
}
