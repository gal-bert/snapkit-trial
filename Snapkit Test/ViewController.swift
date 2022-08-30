//
//  ViewController.swift
//  Snapkit Test
//
//  Created by Gregorius Albert on 30/08/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let greenBox: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    let redBox: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let textfield: UITextField = {
        let view = UITextField()
        view.placeholder = "Lorem Ipsum"
        view.borderStyle = .roundedRect
        return view
    }()
    
    let printButton: UIButton = {
        let view = UIButton(configuration: .tinted())
        view.setTitle("Print Text", for: .normal)
        return view
    }()
    
    let pushButton: UIButton = {
        let view = UIButton(configuration: .tinted())
        view.setTitle("Next Page", for: .normal)
        return view
    }()
    
    let label: UILabel = {
        let view = UILabel()
        view.text = "Hello World"
        view.textAlignment = .center
        return view
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 50
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "First Page"
        navigationController?.navigationBar.prefersLargeTitles = true

        view?.addSubview(greenBox)
        greenBox.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }

        view.addSubview(redBox)
        redBox.snp.makeConstraints { make in
            make.top.equalTo(greenBox.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        view.addSubview(textfield)
        textfield.snp.makeConstraints { make in
            make.top.equalTo(redBox.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }
        
        stackView.addArrangedSubview(printButton)
        stackView.addArrangedSubview(pushButton)
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(textfield.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }

        printButton.addTarget(self, action: #selector(logText), for: .touchUpInside)
        pushButton.addTarget(self, action: #selector(pushNavigation), for: .touchUpInside)
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(40)
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
    }
    
    @objc func logText() -> Void {
        print("Button is clicked: \(textfield.text!)")
        label.text = textfield.text
    }

    @objc func pushNavigation() -> Void {
        let destVC = SecondViewController()
        self.navigationController?.pushViewController(destVC, animated: true)
    }


}

