//
//  ViewModel.swift
//  IMDBClone
//
//  Created by Mohit Mehta on 14/06/22.
//

import Foundation

protocol dateCovertor{
    func dateConvertor(_ movie: Movie) -> String
}
struct MovieVM: dateCovertor{
    
    func dateConvertor(_ movie: Movie) -> String{
        
        var date = movie.year
        if(movie.type.rawValue == TypeEnum.movie.rawValue)
        {
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy"
            let currentyear: String = dateFormatter.string(from: date)
            let yearDiffrence =  Int(currentyear)! - Int(movie.year)!
            
            if(yearDiffrence > 0)
            {
                return "\(yearDiffrence) years back"
            }
            return "This Year"
        }
        
        return date
    }
}


