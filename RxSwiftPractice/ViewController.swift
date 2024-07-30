//
//  ViewController.swift
//  RxSwiftPractice
//
//  Created by 장예지 on 7/30/24.
//

import UIKit
import RxSwift
import SnapKit

class ViewController: UIViewController {
    
    let simpleLabel = UILabel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(simpleLabel)
        simpleLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
    }
}

