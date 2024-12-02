//
//  ViewController.swift
//  Practica
//
//  Created by Whiz on 1/12/24.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tvClientes: UITableView!
    
    // Arreglo de la estructura clientes
    var lista:[ClienteEntity]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lista=ControladorCliente().findAll()
        //origen de datos de la clase actual
        tvClientes.dataSource=self
        //cambiar tamaño de la celda
        tvClientes.rowHeight=200
        //escuchar delegado
        //Dar click en una tabla y obtener Datos del cliente 
        tvClientes.delegate=self
    }

    @IBAction func btnNuevoCliente(_ sender: Any) {
        performSegue(withIdentifier: "nuevo", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //objeto de la clase, itemtableviewcell
        let row=tvClientes.dequeueReusableCell(withIdentifier: "celda") as! ItemTableViewCell
        //ACCEDER A LOS LABEL DEL ITEMTABLEVIEWCELL
        row.lblCodigo.text=String(lista[indexPath.row].codigo)
        row.lblNombre.text=lista[indexPath.row].nombre
        return row
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "datos", sender:nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="datos"{
            let pantalla2=segue.destination as! DatosClienteViewController
            pantalla2.obj=lista[tvClientes.indexPathForSelectedRow!.row]
        }
    }
    
}

