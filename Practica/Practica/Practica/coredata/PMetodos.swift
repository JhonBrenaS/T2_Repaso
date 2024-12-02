//
//  PMetodos.swift
//  Practica
//
//  Created by Whiz on 2/12/24.
//

import UIKit

protocol PMetodos {
    func save(bean:Cliente)->Int
    func findAll()->[ClienteEntity]
    func update(bean:ClienteEntity)->Int
    func deleteById(bean:ClienteEntity)->Int
}
