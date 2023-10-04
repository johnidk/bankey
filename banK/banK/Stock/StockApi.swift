//
//  StockApi.swift
//  banK
//
//  Created by João Gabriel Lavareda Ayres Barreto on 04/10/23.
//

import Foundation

func stockApi() {
    let headers = [
        "X-RapidAPI-Key": "90fdf97d0bmshccf2630fb7719b2p1afb82jsn7eaf5aa4e7c1",
        "X-RapidAPI-Host": "apidojo-yahoo-finance-v1.p.rapidapi.com"
    ]

    let request = NSMutableURLRequest(url: NSURL(string: "https://apidojo-yahoo-finance-v1.p.rapidapi.com/auto-complete?q=tesla&region=US")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(data!)
            print(error as Any)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse!)
        }
    })

    dataTask.resume()

}

