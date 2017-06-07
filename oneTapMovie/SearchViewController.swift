//
//  SearchViewController.swift
//  oneTapMovie
//
//  Created by Fhict on 06/06/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import TMDBSwift

class SearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var tillYearTextField: UITextField!
    @IBOutlet weak var fromYearTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var totalVotesTextField: UITextField!
    @IBOutlet weak var voteAvarageTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    var movieArray = [String]()
    var pickedMovie = ""
    var genre = ["hoi"]
    let years = ["2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010" ,"2011", "", "2012", "2013", "2014" ,"2015" ,"2016" ,"2017"]
    var textFields = [UITextField]()
    let genrePicker = UIPickerView()
    let fromYearPicker = UIPickerView()
    let tillYearPicker = UIPickerView()
    var nowSearching:UIActivityIndicatorView = UIActivityIndicatorView()
    
    let apiKey = "279e6330590f5e8788be345bf87321ca"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set bg and style elements
        self.view.addBackground(imageName: ("bg_one_tap_movie_lines@1x.png"))
        SetTextFieldStyle()
        
        //set navigation buttons
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Watched", style: .plain, target: self, action: #selector(watchedTapped))
        
        //set pickerview
        
        genrePicker.delegate = self
        fromYearPicker.delegate = self
        tillYearPicker.delegate = self
        genrePicker.tag = 1
        fromYearPicker.tag = 2
        tillYearPicker.tag = 3
        //set textfields input to picker
        genreTextField.inputView = genrePicker
        fromYearTextField.inputView = fromYearPicker
        tillYearTextField.inputView = tillYearPicker
        
        GenresMDB.genres(apiKey, listType: .movie, language: "en") { (apiReturn, genres) in
            if let genres = genres{
                genres.forEach{
                    print($0.name!)
                    self.genre.append($0.name!)
                }
            }
        }
       
    }
    
    func SetTextFieldStyle() {
        
        textFields = [tillYearTextField, fromYearTextField, durationTextField, totalVotesTextField, voteAvarageTextField, genreTextField]
        
        for item in textFields {
            item.bottomBorder(textField: item)
            item.setBottomBorder()
        }
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
   
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView.tag == 1 {
            return genre.count
        }else if pickerView.tag == 2 || pickerView.tag == 3 {
            return years.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return genre[row]
        }else if pickerView.tag == 2 || pickerView.tag == 3 {
            return years[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            genreTextField.text = genre[row]
        }else if pickerView.tag == 2 {
            fromYearTextField.text = years[row]
        }else if pickerView.tag == 3 {
            tillYearTextField.text = years[row]
        }
        
       
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func watchedTapped() {
        
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        
        /*nowSearching.center = self.view.center
        nowSearching.hidesWhenStopped = true
        nowSearching.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        view.addSubview(nowSearching)
        nowSearching.startAnimating()*/
        
        
        DiscoverMovieMDB.discoverMoviesWith(apiKey, with_genres: MovieGenres.Action.rawValue, with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: nil, with_networks: nil, year: nil, sort_by: nil, page: 1, language: "en") { (apiReturn, movies) in
            if let movies = movies {
                let randomNumber = arc4random_uniform(UInt32(movies.count))
                print(movies[Int(randomNumber)].title!)
                self.pickedMovie = movies[Int(randomNumber)].title!
                for movie in movies {
                    self.movieArray.append(movie.title!)
                }
            }
        }
        
        
        //fake delay effect
        let when = DispatchTime.now() + 1 // number is delay time
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.performSegue(withIdentifier: "result", sender: self)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let spinningWheelViewController = segue.destination as! SpinningWheelViewController
        spinningWheelViewController.pickedMovie = self.pickedMovie
        spinningWheelViewController.movieArray = self.movieArray
        
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
