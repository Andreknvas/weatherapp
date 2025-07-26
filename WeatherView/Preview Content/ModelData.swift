//
//  ModelData.swift
//  WeatherView
//
//  Created by Deko on 21/07/25.
//

import Foundation

var previewWeather: ResponseBody = load("weatherdata.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("\(filename) não foi encontrado no bundle principal.")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("\(filename) não encontrado no bundle principal:\n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Não foi possível parsear \(filename) como \(T.self):\n\(error)")
    }
}
