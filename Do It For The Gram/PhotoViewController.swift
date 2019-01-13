//
//  PhotoViewController.swift
//  Do It For The Gram
//
//  Created by Charles Martin Reed on 1/11/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    //MARK:- Properties
    let chooseImageButton: UIButton = {
        let button = UIButton()
        //button.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        button.setTitle("Choose image", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
        
        return button
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.frame = CGRect(x: 0, y: 0, width: 500, height: 800)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.image = UIImage(named: "Baby_Hedgehog")
        view.addSubview(chooseImageButton)
        view.addSubview(photoImageView)
        
        setupAutoLayoutConstraints()
    }
    
    private func setupAutoLayoutConstraints() {
        //button constraints
        let buttonConstraints = [
            chooseImageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            chooseImageButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            chooseImageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80)
            ]
        
        let imageViewConstraints = [
            photoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            photoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            photoImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
            ]
        
        let constraints = [buttonConstraints, imageViewConstraints]
        
        for constraint in constraints {
            NSLayoutConstraint.activate(constraint)
        }
        
    }
    
    //MARK:- IBActions
    @objc private func chooseImage() {
        //create a picker
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        //diplay the view controller
        present(imagePicker, animated: true, completion: nil)
        
    }
}

extension PhotoViewController : UINavigationControllerDelegate {
    //for jump between apps
}

extension PhotoViewController : UIImagePickerControllerDelegate {
    //for letting the user determine photo source, camera or library...
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userImage = info[.originalImage] as? UIImage {
            self.photoImageView.image = userImage
        }
        
        dismiss(animated: true, completion: nil)
    }
}
