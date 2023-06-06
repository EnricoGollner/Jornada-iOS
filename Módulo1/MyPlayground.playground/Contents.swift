import Foundation

var fimDeSemana = ["Sexta", "Sabado", "Domingo"]

for (index, value) in fimDeSemana.enumerated() {
    if value == "Sexta" {
        print("Encontrou \(value), removendo-a do index \(index)")
        fimDeSemana.remove(at: index)
        print(fimDeSemana)
    }
}


// MARK: - Dicionário

var notas = [0: "Triste", 7: "É mais ou menos!", 10: "Nice!"]

for valueNota in notas {
    if valueNota.value == "Triste" {
        notas.removeValue(forKey: valueNota.key)
        print(notas)
    }
}
