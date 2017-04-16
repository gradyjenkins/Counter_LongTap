//
//  ViewController.swift
//  CounterLongHold
//
//  Created by Grady Jenkins on 4/16/17.
//  Copyright © 2017 GradyJenkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter: Int = 0
    
    let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    let tapButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 58, g: 21, b: 128)
        button.setTitle("Tap", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        button.addTarget(self, action: #selector(handleCounterQuick), for: .touchUpInside)
        return button
    }()
    
    let counterLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.font = label.font.withSize(80)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(handleCounterLong))
        tapButton.addGestureRecognizer(longTap)
        
        view.backgroundColor = UIColor(r: 206, g: 172, b: 172)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(handleReset))
        navigationItem.title = "Counter v2"
        
        view.addSubview(tapButton)
        view.addSubview(containerView)
        
        setUpContainerView()
        setUpTapButton()
    }

    func handleReset() {
        counter = 0
        counterLabel.text = "0"
    }
    
    func handleCounterQuick() {
        counter += 1
        counterLabel.text = String(counter)
    }
    
    func handleCounterLong() {
        counter += 1
        counterLabel.text = String(counter)
    }
    
    func setUpContainerView() {
        //Center the container in the view
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        //Add counter label to the container
        containerView.addSubview(counterLabel)
        
        //Constraints for label
        counterLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        counterLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        counterLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        counterLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
    }
    
    func setUpTapButton() {
        tapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tapButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 12).isActive = true
        tapButton.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        tapButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }

    
    
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
