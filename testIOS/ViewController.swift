//
//  ViewController.swift
//  testIOS
//
//  Created by Camilo Orjuela on 21/12/21.
//  Copyright © 2021 Camilo Orjuela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOfSections = 1
    var movies: [Movie] = []
    var indiceCeldaABorrar: IndexPath?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var vista: UIView!
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var botonDismissAll: UIButton!
    
    var contenidoLista = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = Service()
        
//        service.getMovies { movies in
//
//            if let movies = movies {
//                print(movies)
//            }
//        }
        
        service.getMoviesAlamofire { movies in
            
            if let movies = movies {
                
                print("Respondio")
                
                self.movies = movies.movies
                self.tableView.dataSource = self
                self.tableView.delegate = self
                self.tableView.reloadData()
            }
        }
        
        labelView.text = "Hola"
        self.tableView.register(UINib(nibName: "celdas", bundle: nil), forCellReuseIdentifier: "reuso")
    }
    
    @IBAction func dismissAllAccion(_ sender: Any) {
        
        numberOfSections = 0
        
        let indexSet = IndexSet(integer: 0)
        tableView.deleteSections(indexSet, with: .left)
    }
    
}



extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Your Messages"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let lista = tableView.dequeueReusableCell(withIdentifier: "reuso", for: indexPath) as? celdas else {
            return UITableViewCell()
        }
        
        lista.delegate = self
        lista.index = indexPath
        lista.configurar(movie: movies[indexPath.row])

        return lista
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movies[indexPath.row].leido = true
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}

extension ViewController: accionesCelda {
    
    func borrarCelda(en index: IndexPath) {
        
        movies.remove(at: index.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [index], with: .left)
        tableView.endUpdates()
        tableView.reloadData()
    }
}

/*
 func numberOfSections(in tableView: UITableView) -> Int {
 return 2
 */

protocol telefono {
    func llamar()
    func colgar()
    func marcar()
}

class iphone: telefono {
    func llamar() {
        //
    }
    
    func colgar() {
        //
    }
    
    func marcar() {
        //
    }
    
    func enviarMensajes() {
        
    }
}

class samsung: telefono {
    func llamar() {
        
    }
    
    func colgar() {
        
    }
    
    func marcar() {
        
    }
}

class secretaria {
    
    var delegadoLlamadas: telefono
    
    init(llamador: telefono) {
        delegadoLlamadas = iphone()
    }
    
    func llamarPersonas() {
        delegadoLlamadas.llamar()
    }
}
