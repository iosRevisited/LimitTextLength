//
//  ViewController.swift
//  LimitTextLength
//
//  Created by Sai Sandeep on 13/11/17.
//  Copyright © 2017 iosRevisited. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate, UITextViewDelegate {
    
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addTextField()
        addTextView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addTextField() {
       
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.borderStyle = .roundedRect
        textField.keyboardType = .phonePad
        textField.placeholder = "Mobile no"
        view.addSubview(textField)
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func addTextView() {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = self
        textView.keyboardType = .default
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.lightGray
        view.addSubview(textView)
        textView.topAnchor.constraint(equalTo: textField.topAnchor, constant: 60).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 10 // Change limit based on your requirement.
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
        return updatedText.count <= 50 // Change limit based on your requirement.
    }
}

