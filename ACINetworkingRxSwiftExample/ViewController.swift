//
//  ViewController.swift
//  ACINetwrokingRxSwiftExample
//
//  Created by 张伟 on 2021/12/10.
//

import UIKit
import ACINetworking
import RxSwift

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ExampleService.shared.rx.request(.userInfo)
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .asObservable()
            .subscribe(onNext: { json in
                print(json)
            }, onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
}

