//
//  Mentors.swift
//  AJob
//
//  Created by Lisette Antigua on 5/12/22.
//

import Foundation
import UIKit

struct ListOfMentors{
    var type:String
    var mentors:[Mentor]
}


struct Mentor{
    var name: String
    var profession:String
    var jobDescription:String
    var contactInfo:String
    var image:UIImage

}
