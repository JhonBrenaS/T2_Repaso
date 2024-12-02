//
//  DatosClienteViewController.swift
//  Practica
//
//  Created by Whiz on 2/12/24.
//

import UIKit

class DatosClienteViewController: UIViewController {

    @IBOutlet weak var txtCodigo: UITextField!
    
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var txtApellido: UITextField!
    
    @IBOutlet weak var txtCredito: UITextField!
    //atributos de la estructura cliente
    //var obj:Cliente!
    
    var obj:ClienteEntity!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtCodigo.text=String(obj.codigo)
        txtNombre.text=obj.nombre
        txtApellido.text=obj.apellido
        txtCredito.text=String(obj.credito)
    }
    
    @IBAction func btnActualizar(_ sender: Any) {
        let nom=getNombre()
        let ape=getApellido()
        let cre=getCredito()
        //MODIFICAR LOS VALORES DEL ATRIBUTO
        obj.nombre=nom
        obj.apellido=ape
        obj.credito=cre


        let estado=ControladorCliente().update(bean: obj)
        if estado>0{
            getVentana("Cliente actualizado con exito")
        }
        else{
            getVentana("Error en la actualización")
        }
    }
    
    @IBAction func btnEliminar(_ sender: Any) {
        let ventana=UIAlertController(title: "Sistema", message: "Seguro de eliminar cliente?", preferredStyle: .alert)
        let botonA=UIAlertAction(title: "SI", style: .default, handler: {
            x in
            var salida=ControladorCliente().deleteById(bean: self.obj)
            if salida>0{
                self.getVentana("Cliente eliminado")
            }
            else{
                self.getVentana("Error al eliminar el cliente")
            }
        })
        
        ventana.addAction(botonA)
        ventana.addAction(UIAlertAction(title: "NO", style: .cancel))
        
        present(ventana, animated: true)
    }
    
    @IBAction func btnVolver(_ sender: Any) {
        performSegue(withIdentifier: "volver2", sender: nil)

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
