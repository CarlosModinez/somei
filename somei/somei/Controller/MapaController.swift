//
//  MapaController.swift
//  Somei
//
//  Created by Felipe Mesquita on 05/12/19.
//  Copyright © 2019 José Guilherme Bestel. All rights reserved.
//

import Foundation
import CoreLocation

class MapaController {
    
    static var instance =  MapaController()
    
    private init () {}
    
    // Se já ativou a localização
    private var ativo = false
    
    // Coordena o uso da localização. Pedimos as coisas pra esse cara
    let locationManager = CLLocationManager()
    
    
    // Configura e ativa a localização
    private func iniciarMapa () {
        guard !ativo else {
            return
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest  // precisão
        
        locationManager.distanceFilter  = kCLDistanceFilterNone  // só atualiza se dist > filter?
        
        // Começa a atualizar a localização
        locationManager.startUpdatingLocation()
        
        // Marca que já está com a localização ativa
        ativo = true
        
        return
    }
    
    // Ativa o mapa se já tiver a permissão
    func ativarMapaSePuder () {
        if temosPermissaoMapa() > 0 {
            iniciarMapa()
        }
        return
    }
    
    
    // Retorna dizendo se está ou não autorizado a usar a localização
    func temosPermissaoMapa () -> Int {
        // Verifica se já está autorizado
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
            case .notDetermined:
                return 0
                
            case .authorizedWhenInUse:
                return 1
    
            case .authorizedAlways:
                return 1
            
            case .restricted:
                return -1
            
            case .denied:
                return -1
            
            @unknown default:
                return -2
        }
    }
    
    // Pede a permissão pro mapa
    func pedirPermissaoMapa () {
        print("Entrou, ", temosPermissaoMapa())
        
        // Se já tiverem dado a resposta, cai fora
        guard temosPermissaoMapa() == 0 else {
            return
        }
        
        print("Passou")
        
        // ---- Configura as permissões de localização
        // Se o GPS está ligado
        if CLLocationManager.locationServicesEnabled() {
            
            print("IF")
            // Pede permissão
            locationManager.requestWhenInUseAuthorization()
            // Se o GPS não estiver ligado...?
        }
        
        return
    }
    
    // Retorna as coordenadas do usuário
    func getlatLon(endereco : Endereco) -> CLLocation? {
        
        // Prepara o retorno
        var coordenadas : CLLocation? = nil
        
        // Monta o endereço
        let numero = endereco.numero
        let logradouro = endereco.logradouro
        let cidade = endereco.cidade
        let enderecoCompleto = "\(numero)+\(logradouro),+\(cidade)".replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        print(enderecoCompleto)
        
        // Cria um semáforo pra evitar terminar sem ter os dados
        let semaphore = DispatchSemaphore(value: 0)
        
        // Manda o endereço pra API
        let url = URL(string: "https://nominatim.openstreetmap.org/search?q=\(enderecoCompleto),+Brazil&format=json&addressdetails=0")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                semaphore.signal()
                return
            }
            
            print(String(data: data, encoding: .utf8)!)
            print("\n\n\n")

            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [Dictionary<String, AnyObject>]
                
                guard json!.count > 0 else {
                    semaphore.signal()
                    return
                }
                
                let lon = json?[0]["lon"] as? String
                let lat = json?[0]["lat"] as? String

                print("self.latitude = \(Double(lat ?? "0")!)")
                print("self.longitude = \(Double(lon ?? "0")!)")
                
                guard (lat != nil) && (lon != nil) else {
                    semaphore.signal()
                    return
                }
                coordenadas = CLLocation(latitude: CLLocationDegrees(lat!)!, longitude: CLLocationDegrees(lon!)!)
                print("Coordenadas Dentro = \(String(describing: coordenadas))")
                semaphore.signal()

            }catch _{
                semaphore.signal()
            }

        }
        task.resume()
        print("Coordenadas = \(String(describing: coordenadas))")
        
        semaphore.wait()

        return coordenadas
    }
    
    
    // Retorna a distância entre aqui e outro ponto
    func getDistanciaKm (ate ponto : CLLocation) -> Float {
        var distancia : Float

        if temosPermissaoMapa() > 0 {
            //print("Aqui: \(locationManager.location)")
            //print("Distancia: \(ponto.distance(from: locationManager.location!))")
            distancia = Float(ponto.distance(from: locationManager.location!)) / 1000
        }
        else {
            distancia = -1
        }
        
        return distancia
    }
    

    
    
}
