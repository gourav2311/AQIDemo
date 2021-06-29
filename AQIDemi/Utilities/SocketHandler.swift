//
//  SocketHandler.swift
//  AQIDemi
//
//  Created by Apple on 24/06/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import Starscream

struct AqiData: Codable {
    var city: String?
    var aqi: Double?
}

class SocketHandler: NSObject {
    static let sharedInstance = SocketHandler()
    var arrData = [AqiData]()
    var socket: WebSocket?
    var timer: Timer?
    
    private override init() {
        super.init()
    }
    deinit {
        print("controller deinint>>>>>>>>>>>>")
    }
    //    func connectToSocket(callback:@escaping (_ isConnected: Bool) -> Void) {
    func connectToSocket() {
//        self.socket = WebSocket(request: URLRequest(url: URL(string: "\(Config.baseURL)")!))
        self.socket = WebSocket(url:URL(string: "\(Config.baseURL)")!)

        self.socket?.delegate = self
        self.socket?.connect()
    }
    func disconnectSocket()  {
        self.socket?.disconnect()
    }
    
}
extension SocketHandler: WebSocketDelegate {
    func websocketDidConnect(socket: WebSocket) {
    }
    
    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        print("websocketDidDisconnect")
        
    }
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        
        print("websocketDidReceiveMessage:\(text)")
        //self.arrData.append(text)
        let decoder = JSONDecoder()
        do {
            print(self.arrData.count)
            
            if (arrData.count == 0){
                self.arrData = try decoder.decode([AqiData].self, from: text.data(using: .utf8)!)
            }
            else{
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 30.0) {
                    
                    do{
                        self.arrData = try decoder.decode([AqiData].self, from: text.data(using: .utf8)!)
                    }
                    catch {
                        print(error)
                    }
                }
                
                
                
            }
            
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateData"), object: nil, userInfo: ["data": self.arrData])
            
            
            
        } catch {
            print(error)
        }
    }
   
    func websocketDidReceiveData(socket: WebSocket, data: Data) {
        print("websocketDidReceiveData")
        
    }
}

