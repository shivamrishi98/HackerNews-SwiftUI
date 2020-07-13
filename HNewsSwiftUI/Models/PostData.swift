//
//  PostData.swift
//  HNewsSwiftUI
//
//  Created by Shivam Rishi on 12/07/20.
//  Copyright © 2020 shivam. All rights reserved.
//

import Foundation

struct Results: Decodable
{
    let hits: [Post]
}

struct Post: Decodable,Identifiable
{
    var id:String {
        return objectID
    }
    let objectID:String
    let points:Int
    let title:String
    let url:String?
}
