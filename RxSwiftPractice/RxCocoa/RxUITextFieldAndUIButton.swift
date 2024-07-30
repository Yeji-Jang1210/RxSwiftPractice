//
//  RxUITextFieldAndUIButton.swift
//  RxSwiftPractice
//
//  Created by 장예지 on 7/30/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class RxUITextFieldAndUIButton: ViewController {
    
    private let signName = UITextField()
    private let signEmail = UITextField()
    private let simpleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(signName)
        view.addSubview(signEmail)
        view.addSubview(simpleButton)
        
        signName.snp.makeConstraints { make in
            make.top.equalTo(simpleLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        signEmail.snp.makeConstraints { make in
            make.top.equalTo(signName.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        simpleButton.snp.makeConstraints { make in
            make.top.equalTo(signEmail.snp.bottom).offset(20)
            make.size.equalTo(50)
        }
        
        signName.backgroundColor = .lightGray
        signEmail.backgroundColor = .red
        simpleButton.backgroundColor = .blue
        
        setSign()
    }
    
    private func setSign(){
        Observable.combineLatest(signName.rx.text.orEmpty, signEmail.rx.text.orEmpty){ value1, value2 in
            return "name은 \(value1)이고, 이메일은 \(value2)입니다."
        }
        .bind(to: simpleLabel.rx.text)
        .disposed(by: disposeBag)
        
        signName.rx.text.orEmpty
            .map { $0.count < 4 }
            .bind(to: signEmail.rx.isHidden, simpleButton.rx.isHidden)
            .disposed(by: disposeBag)
        
        signEmail.rx.text.orEmpty
            .map { $0.count > 4 }
            .bind(to: simpleButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        simpleButton.rx.tap
            .subscribe { _ in
                self.showAlert()
            }
            .disposed(by: disposeBag)
    }
    
    private func showAlert(){
        //actionSheet는 message는 거의 안씀
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        //2.
        let open = UIAlertAction(title: "열기", style: .default)
        let delete = UIAlertAction(title: "삭제", style: .destructive)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        //3. addAction한 순서대로 alert에 표시됨
        //단, style.cancel은 고정적인 위치이기 때문에 addAction해도 맨 밑으로 붙음
        //style.cancel은 alert에서 하나만 가질 수 있음 - 여러개 사용시 런타임 에러 발생
        alert.addAction(open)
        alert.addAction(delete)
        alert.addAction(cancel)
        
        //4.
        present(alert, animated: true)
    }
    
}
