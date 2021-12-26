//
//  celdas.swift
//  testIOS
//
//  Created by Camilo Orjuela on 21/12/21.
//  Copyright © 2021 Camilo Orjuela. All rights reserved.
//

import UIKit

protocol accionesCelda {
    func borrarCelda(en index: IndexPath)
}

class celdas: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var botonDismiss: UIButton!
    
    var delegate: accionesCelda?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label.numberOfLines = 0
        label.textColor = .white
        backgroundColor = .black
    }
    
    func configurar(movie: Movie) {
        label.text = movie.title
        imagen.isHidden = movie.leido ?? false
    }
    
    @IBAction func botonDismissAccion(_ sender: Any) {
        if let index = index {
            delegate?.borrarCelda(en: index)
        }
    }
}

/*
 @IBOutlet weak var primerLabel: UILabel!
    @IBOutlet weak var segundoLabel: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        primerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        primerLabel.textColor = .blue
        
        segundoLabel.numberOfLines = 0
        
        backgroundColor = .gray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        print(primerLabel.text ?? "")
        
    }
 */
