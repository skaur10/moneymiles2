//
//  organizeViewController.swift
//  sportsconnect
//
//  Created by Juan Bravo on 2/16/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit

class organizeViewController: UIViewController {

    func csv(data: String) ->[[String]]
    {
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        for row in rows
        {
            let columns = row.components(separatedBy: ",")
            result.append(columns)
            
        }
        return result
        
    }
    
    func readDataFromCSV(fileName:String, fileType: String)-> String!{
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
            else {
                return nil
        }
        do {
            var contents = try String(contentsOfFile: filepath, encoding: .utf8)
            contents = cleanRows(file: contents)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }
    
    
    func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        //        cleanFile = cleanFile.replacingOccurrences(of: ";;", with: "")
        //        cleanFile = cleanFile.replacingOccurrences(of: ";\n", with: "")
        return cleanFile
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var data = readDataFromCSV(fileName: "openData", fileType:"CSV")
        data = cleanRows(file : data!)
        let csvRows = csv(data :data!)
        print(csvRows[1][1])
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
