import Foundation

public func indiceEn<Element:Equatable>(valor:Element, array:[Element]) -> Int? {
    for (indice, dato) in array.enumerated() {
        if valor == dato {
            return indice
        }
    }
    return nil
}

public enum Gender:String, Codable {
    case male = "Male"
    case female = "Female"
}

public struct Empleado:Codable {
    let id:Int
    let username:String
    let first_name:String
    let last_name:String
    let gender:Gender
    let email:String
    let department:String
    let address:String
    var zipcode:String?
    let avatar:URL
}

public func getEmpleados() -> [Empleado] {
    guard let url = Bundle.module.url(forResource: "EmpleadosData", withExtension: "json") else {
        return []
    }
    do {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Empleado].self, from: data)
    } catch {
        print("Error en la carga \(error)")
    }
    return []
}
