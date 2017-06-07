//
//  SpinningWheelViewController.swift
//  oneTapMovie
//
//  Created by Fhict on 07/06/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class SpinningWheelViewController: UIViewController {
    
    @IBOutlet weak var selectedMovie: UILabel!
    var pickedMovie = ""
    var movieArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground(imageName: ("bg_one_tap_movie_lines@1x.png"))
        showPickedMovie()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showPickedMovie() {
        
        var add = 0.1
        for m in movieArray{
            
            //fake delay effect
            let when = DispatchTime.now() + (0.5 + add) // number is delay time
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.selectedMovie.text = m
                
                add += 0.1
            }
            
            
        }
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
