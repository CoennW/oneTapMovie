//
//  SearchViewController.swift
//  oneTapMovie
//
//  Created by Fhict on 06/06/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var genreTextField: UITextField!
    var genre = ["Action", "Comedy"]
    let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set bg and style elements
        self.view.addBackground(imageName: ("bg_one_tap_movie_lines@1x.png"))
        genreTextField.bottomBorder(textField: genreTextField)
        genreTextField.setBottomBorder()
        
        //set navigation buttons
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Watched", style: .plain, target: self, action: #selector(searchTapped))
        
        //set pickerview
        picker.delegate = self
        picker.dataSource = self
        
        //set textfields to picker 
        genreTextField.inputView = picker
        
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
   
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return genre.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genre[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genreTextField.text = genre[row]
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func searchTapped() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
