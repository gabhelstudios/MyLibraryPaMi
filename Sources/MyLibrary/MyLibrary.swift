public func indiceEn<Element:Equatable>(valor:Element, array:[Element]) -> Int? {
    for (indice, dato) in array.enumerated() {
        if valor == dato {
            return indice
        }
    }
    return nil
}
