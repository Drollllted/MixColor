//
//  NetworkData.swift
//  ColorMix
//
//  Created by Drolllted on 26.05.2024.
//

import Foundation

class NetworkData {
    private var mixColor: MixColor!
    
    static let shared = NetworkData()
    
    private init(){}
    
    func getColorsCalled(rgb: String, completion: @escaping (String?) -> ()) {
        guard let url = URL(string: "https://www.thecolorapi.com/id?rgb=\(rgb)") else {return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            //MARK: - response
            guard let response = response else {return}
            print(response)
            
            //MARK: - DATA
            guard let data = data else {return}
            print(data)
            do{
                let decoder = JSONDecoder()
                let json = try decoder.decode(JSONCaller.self, from: data)
                print(json.name.value)
                
            } catch {
                debugPrint(error)
            }
            
            //MARK: - Error
            guard let error = error else {return}
            print(error)
        }
        task.resume()
    }
    
}
