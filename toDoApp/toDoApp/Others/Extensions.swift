//
//  Extensions.swift
//  toDoApp
//
//  Created by Dilara Büker on 20.09.2024.
//

import Foundation

// Encodable protokolünü genişletiyoruz, böylece her Encodable nesne bu fonksiyonu kullanabilir.
extension Encodable {
    
    // Encodable nesneyi [String: Any] formatında bir sözlüğe dönüştüren fonksiyon.
    func asDictionary() -> [String: Any] {
        
        // Nesneyi JSON verisi (Data) formatına çevirmeye çalışıyoruz.
        // JSONEncoder().encode(self), nesneyi JSON formatında Data tipine dönüştürür.Eğer başarısız olursa, boş bir sözlük döndürür.
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]  // Kodlama başarısız olursa boş bir sözlük döndür.
        }
        
        // JSON verisini sözlük formatına çevirmeye çalışıyoruz.
        do {
            // JSONSerialization, JSON verisini bir Swift nesnesine (genellikle sözlük ya da dizi) dönüştürür.
            // Dönüşen veriyi [String: Any] formatında bir sözlük olarak almayı deniyoruz.
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            
            // Başarılı olursa sözlüğü döndür, aksi takdirde boş bir sözlük döndür.
            return json ?? [:]
            
        } catch {
            // Eğer JSON verisi sözlüğe çevrilemezse, boş bir sözlük döndür.
            return [:]
        }
    }
}
