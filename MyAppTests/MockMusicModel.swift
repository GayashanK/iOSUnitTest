//
//  MockMusicModel.swift
//  MyAppTests
//
//  Created by Kasun Gayashan on 05.02.22.
//  Copyright © 2022 Bear Cahill. All rights reserved.
//

import Foundation
@testable import MyApp

class MockMusicModel: MusicModel{
    
    override func fetchMusic(completion: @escaping ([[String : Any]]?, Error?) -> Void) {
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "Music", ofType: "json") {
            if let data = try? Data.init(contentsOf: URL(fileURLWithPath: path)) {
                let parseData = self.parseJSON(data: data)
                completion(parseData,nil)
            }
        }
    }
}
