//
//  ColorView.swift
//  Comp Colors
//
//  Created by Alex Wayne on 11/9/22.
//

import Foundation
import UIKit

class ColorView: UIView {
    
    let rgbLabel: OutlinedLabel = {
        let label = OutlinedLabel()
        label.textColor = .white
        label.outlineColor = .black
        label.outlineWidth = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hexLabel: OutlinedLabel = {
        let label = OutlinedLabel()
        label.textColor = .white
        label.outlineColor = .black
        label.outlineWidth = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func setupSubviews(){
        rgbLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        rgbLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10).isActive = true
        rgbLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        hexLabel.topAnchor.constraint(equalTo: rgbLabel.bottomAnchor, constant: 20).isActive = true
        hexLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        hexLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    
        addSubview(rgbLabel)
        addSubview(hexLabel)
        
        setupSubviews()
        
    }
    
}
