//
//  SecondViewController.swift
//  Snapkit Test
//
//  Created by Gregorius Albert on 30/08/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    let label: UILabel = {
        let view = UILabel()
        view.text = "This is the second view controller"
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Second Page"
        
        navigationItem.largeTitleDisplayMode = .never

        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
    }

}
