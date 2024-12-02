//
//  ControladorCliente.swift
//  Practica
//
//  Created by Whiz on 2/12/24.
//

import UIKit

class ControladorCliente:PMetodos {
    
    func save(bean: Cliente) -> Int {
        var salida = -1
        //crear objeto de la clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
        //acceder a la variable persistentContainer "Conexion con la bd"
        let contextBD=delegate.persistentContainer.viewContext
        //acceder a ka entidad
        let tabla=ClienteEntity(context: contextBD)
        //Setear los atributos del parametro bean a la tabla
        tabla.codigo=Int16(bean.codigo)
        tabla.nombre=bean.nombre
        tabla.apellido=bean.apellido
        tabla.credito=bean.credito
        //CONTROLAR LA EXCEPCION
        do {
            //GRABAR
            try contextBD.save()
            salida=1
        } catch let ex as NSError {
            print(ex.localizedDescription)
        }
        return salida
    }
    
    
    func findAll() -> [ClienteEntity] {
        //declarar
        var datos:[ClienteEntity]!
        //crear objeto de la clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
        //acceder a la variable persistentContainer "Conexion con la bd"
        let contextBD=delegate.persistentContainer.viewContext
        //Obtener contenido de la entidad ClienteEntity
        let registros=ClienteEntity.fetchRequest()
        //CONTROLAR LA EXCEPCION
        do {
            //RECORRIDO SOBRE REGISTROS Y GUARDAR LA INFORMACION DENTOR DE DATOS
            try datos=contextBD.fetch(registros)
        } catch let ex as NSError {
            print(ex.localizedDescription)
        }
        return datos
    }
    
    func update(bean: ClienteEntity) -> Int {
        var salida = -1
        //crear objeto de la clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
        //acceder a la variable persistentContainer "Conexion con la bd"
        let contextBD=delegate.persistentContainer.viewContext
        //CONTROLAR LA EXCEPCION
        do {
            //GRABAR
            try contextBD.save()
            salida=1
        } catch let ex as NSError {
            print(ex.localizedDescription)
        }
        return salida
    }
    
    func deleteById(bean: ClienteEntity) -> Int {
        var salida = -1
        //crear objeto de la clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
        //acceder a la variable persistentContainer "Conexion con la bd"
        let contextBD=delegate.persistentContainer.viewContext
        //CONTROLAR LA EXCEPCION
        do {
            //Eliminar
            contextBD.delete(bean)
            //grabar
            try contextBD.save()
            salida=1
        } catch let ex as NSError {
            print(ex.localizedDescription)
        }
        return salida
    }
}
