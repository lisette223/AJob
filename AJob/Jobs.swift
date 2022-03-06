//
//  Jobs.swift
//  AJob
//
//  Created by Lisette Antigua on 3/5/22.
//

import Foundation
import UIKit

struct ListOfJobs{
    var type:String
    var jobs:[Jobs]
}


struct Jobs{
    var name: String
    var description:String
    var requirements:String
    var contact:String
    var image:UIImage

}
