//
//  NuevoClienteViewController.swift
//  Practica
//
//  Created by Whiz on 2/12/24.
//

import UIKit

class NuevoClienteViewController: UIViewController {

    @IBOutlet weak var txtCodigo: UITextField!
    
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var txtApellido: UITextField!
    
    @IBOutlet weak var txtCredito: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnNuevo(_ sender: Any) {
        let cod=getCodigo()
        let nom=getNombre()
        let ape=getApellido()
        let cre=getCredito()
        let obj=Cliente(codigo: cod, nombre: nom, apellido: ape, credito: cre)
        let estado=ControladorCliente().save(bean: obj)
        if estado>0{
            getVentana("Cliente registrado con exito")
        }
        else{
            getVentana("Error en el registro")
        }
    }
    
    @IBAction func btnVolver(_ sender: Any) {
        performSegue(withIdentifier: "volver1", sender: nil)
    }
    
    //funcion para crear ventana de mensaje
    func getVentana(_ msg:String){
        let ventana=UIAlertController(title: "Sistema", message: msg, preferredStyle: .alert)
        //crear boton
        ventana.addAction(UIAlertAction(title:"Aceptar", style: .default))
        //mostrar ventana
        present(ventana, animated: true)
    }
    
    func getCodigo()->Int{
        return Int(txtCodigo.text ?? "0") ?? 0
    }
    
    func getNombre()->String{
        return txtNombre.text ?? ""
    }
    
    func getApellido()->String{
        return txtApellido.text ?? ""
    }
    
    func getCredito()->Double{
        return Double(txtCredito.text ?? "0") ?? 0
    }
}
