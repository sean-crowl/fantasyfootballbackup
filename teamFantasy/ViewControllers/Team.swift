//
//  Team.swift
//  teamFantasy
//
//  Created by Sean Crowl on 11/18/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//

import Foundation
import UIKit

class Team: NSObject, NSCoding {
    var title = ""
    var categorySet: Int = 0
    var categoryLabel = ""
    var priority: Double = 0.0
    var id = UUID.init().uuidString
    var team = ""
    var helmet: UIImage?
    
    let titleKey = "title"
    let categoryKey = "category"
    let categorySetKey = "categorySet"
    let priorityKey = "priority"
    let categoryLabelKey = "categoryLabel"
    let idKey = "id"
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
    
    override init() {
        super.init()
        
    }
    
    init(title: String, dueDate: String) {
        self.title = title
        self.dueDate = dueDate
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: titleKey) as! String
        self.categorySet = aDecoder.decodeInteger(forKey: categorySetKey)
        self.priority = aDecoder.decodeDouble(forKey: priorityKey)
        self.categoryLabel = aDecoder.decodeObject(forKey: categoryLabelKey) as! String
        self.id = aDecoder.decodeObject(forKey: idKey) as! String
        
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: titleKey)
        aCoder.encode(categorySet, forKey: categorySetKey)
        aCoder.encode(priority, forKey: priorityKey)
        aCoder.encode(categoryLabel, forKey: categoryLabelKey)
        aCoder.encode(id, forKey: idKey)
    }
}


