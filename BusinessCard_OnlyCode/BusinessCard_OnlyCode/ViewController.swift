//
//  ViewController.swift
//  BusinessCard_OnlyCode
//
//  Created by Fernando Benavides Rodriguez on 7/14/18.
//  Copyright © 2018 Nockzblack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImageWithAutoLayout(nameOfImage: "fernando-Profile")
        loadNameLabelWithAutoLayout(name: "Fernando Benavides Rodríguez")
        loadPhoneNumberLabelWithAutoLayout(phoneNumber: "+(52) 3173851431")
        loadEmailLabelWithAutoLayout(email: "nockzblack@gmail.com")
        loadJobLabelWithAutoLayout(jobPosition: "Developer")
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NSLayoutConstraint.activate(constraintsToApply)
        self.view.layoutIfNeeded()
    }
    
    // Vars
    var constraintsToApply = [NSLayoutConstraint]()
    let profileImage = UIImageView()
    let nameLabel = UILabel()
    let phoneNumberLabel = UILabel()
    let jobLabel = UILabel()
    let emailLabel = UILabel()
    
    
    // Funcs
    
    func loadImageWithAutoLayout(nameOfImage: String) {
        
        // Setting up the image
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.image = UIImage(named: nameOfImage)
        profileImage.contentMode = UIViewContentMode.scaleToFill
        profileImage.clipsToBounds = true
        self.view.addSubview(profileImage)
        
        // Constrains
        let centerXConstraint = profileImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
        let centerYConstraint = profileImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0)
        let widthConstraint = profileImage.widthAnchor.constraint(equalToConstant: 175)
        let heightConstraint = profileImage.heightAnchor.constraint(equalToConstant: 175)
        
        profileImage.layer.cornerRadius = widthConstraint.constant / 2.0
        
        constraintsToApply.append(centerXConstraint)
        constraintsToApply.append(centerYConstraint)
        constraintsToApply.append(widthConstraint)
        constraintsToApply.append(heightConstraint)
    }
    
    
    func loadNameLabelWithAutoLayout(name: String) {
        
        // Setting up the label
        nameLabel.text = name
        nameLabel.textColor = UIColor.black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.font = UIFont(name: "Futura", size: 25)
        self.view.addSubview(nameLabel)
        
        // Constrains
        let leadingConstraint = nameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0)
        let trailingConstraint = nameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)
        let topConstraint = nameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 25)
        let heightConstraint = nameLabel.heightAnchor.constraint(equalToConstant: 35)
        
        constraintsToApply.append(leadingConstraint)
        constraintsToApply.append(trailingConstraint)
        constraintsToApply.append(topConstraint)
        constraintsToApply.append(heightConstraint)
    }


    func loadPhoneNumberLabelWithAutoLayout(phoneNumber: String) {
        
        // Setting up the label
        phoneNumberLabel.text = phoneNumber
        phoneNumberLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.textAlignment = NSTextAlignment.left
        phoneNumberLabel.font = UIFont(name: "Futura", size: 18)
        phoneNumberLabel.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        self.view.addSubview(phoneNumberLabel)
        
        // Constrains
        let widthConstraint = phoneNumberLabel.widthAnchor.constraint(equalToConstant: 175)
        let heightConstraint = phoneNumberLabel.heightAnchor.constraint(equalToConstant: 25)
        
        let bottomConstraint = phoneNumberLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20)
        let leadingConstraint = phoneNumberLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10)
        
        constraintsToApply.append(widthConstraint)
        constraintsToApply.append(heightConstraint)
        constraintsToApply.append(bottomConstraint)
        constraintsToApply.append(leadingConstraint)
        
    }

    
    func loadEmailLabelWithAutoLayout(email: String) {
        
        // Setting up the label
        emailLabel.text = email
        emailLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.textAlignment = NSTextAlignment.right
        emailLabel.font = UIFont(name: "Futura", size: 18)
        emailLabel.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        self.view.addSubview(emailLabel)
        
        // Constrains
        let heightConstraint = emailLabel.heightAnchor.constraint(equalToConstant: 25)
        
        let bottomConstraint = emailLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20)
        
        let trailingConstraint = emailLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)
        let leadingConstraint = emailLabel.leadingAnchor.constraint(equalTo: self.phoneNumberLabel.trailingAnchor, constant: 10)
        
        constraintsToApply.append(heightConstraint)
        constraintsToApply.append(bottomConstraint)
        constraintsToApply.append(trailingConstraint)
        constraintsToApply.append(leadingConstraint)
    }
    
    
    func loadJobLabelWithAutoLayout(jobPosition: String) {
        
        // Setting up the label
        jobLabel.text = jobPosition
        jobLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        jobLabel.translatesAutoresizingMaskIntoConstraints = false
        jobLabel.textAlignment = NSTextAlignment.center
        jobLabel.font = UIFont(name: "Futura", size: 20)
        self.view.addSubview(jobLabel)
        
        // Constraintns
        let leadingConstraint = jobLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0)
        let trailingConstraint = jobLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)
        
        let topConstraint = jobLabel.topAnchor.constraint(equalTo: self.profileImage.bottomAnchor, constant: 15)
        
        let heightConstraint = jobLabel.heightAnchor.constraint(equalToConstant: 35)
        
        constraintsToApply.append(leadingConstraint)
        constraintsToApply.append(trailingConstraint)
        constraintsToApply.append(topConstraint)
        constraintsToApply.append(heightConstraint)
    }
    
    
    
    
    
}

