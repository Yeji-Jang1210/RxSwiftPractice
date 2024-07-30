//
//  RxUITableView.swift
//  RxSwiftPractice
//
//  Created by 장예지 on 7/30/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class RxUITableView: ViewController {
    private let simpleTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(simpleTableView)

        simpleTableView.snp.makeConstraints { make in
            make.top.equalTo(simpleLabel.snp.bottom)
            make.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        simpleTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        setTableView()
    }
    
    func setTableView(){
        let items = Observable.just([
            "First Item",
            "Second Item",
            "Third Item"
        ])
        
        items
            .bind(to: simpleTableView.rx.items){ (tableView, row, element) in
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
                cell.textLabel?.text = "\(element) @row \(row)"
                return cell
            }
            .disposed(by: disposeBag)
        
        simpleTableView.rx.modelSelected(String.self)
            .map { "\($0)를 클릭했습니다." }
            .bind(to: simpleLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
