//
//  UIViewController+Navigation.swift
//  PilotPlantSwift
//
//  Created by lingostar on 2014. 10. 28..
//  Copyright (c) 2014년 lingostar. All rights reserved.
//

import UIKit
import ObjectiveC
import PilotPlant

private var backButtonHidden : Bool = false
private var tapKBDismiss : Bool = false

class PopoverHostScene: CHPopoverHostViewController {
    
}

class ActivityScene: CHActivityViewController {
    
}

class AlertScene: CHAlertViewController {
    @IBInspectable var alertStyle:Bool = false
    @IBInspectable var alertTitle:String = ""
    @IBInspectable var message:String = ""
    @IBInspectable var redButton:String? = nil
    @IBInspectable var buttonNames:String = ""
    
    override func viewDidLoad() {
        super.alertStyle_inspect = alertStyle
        super.alertTitle_inspect = alertTitle
        super.message_inspect = message
        super.redButton_inspect = redButton
        super.buttonNames_inspect = buttonNames
    }
}

class PickerScene: CHPickerViewController {
    @IBInspectable var column : Int = 1
    @IBInspectable var plistName : String = ""
    
    override func viewDidLoad() {
        super.column_inspect = column
        super.plistName_inspect = plistName
    }
}

class WebScene: CHWebViewController {
    @IBInspectable var pageURL:String = "www.apple.com"
    @IBInspectable var localFile:Bool = false
    
    override func viewDidLoad() {
        super.URL_inspect = pageURL
        super.localFile_inspect = localFile
    }
}

class MapScene: CHMapViewController {
    @IBInspectable var mapCenter:CGPoint = CGPointMake(36.976775, 128.362891)
    @IBInspectable var mapSpan:CGSize = CGSizeMake(0.005, 0.005)
    
    override func viewDidLoad() {
        super.mapCenter_inspect = mapCenter
        super.mapSpan_inspect = mapSpan
    }
}


class ImageScrollScene: CHImageScrollViewController {
    @IBInspectable var imageName : String = ""
    
    override func viewDidLoad() {
        super.imageName_inspect = imageName
    }
    @IBAction func zoomToScale(sender: AnyObject) {
        super.scaleTo(sender)
    }
    
}


class MovieScene: CHMoviePlayViewController {
    @IBInspectable var movieName:String = ""
    
    override func viewDidLoad() {
        super.movieName_inspect = movieName
    }
}


class StopMotionScene: CHStopMotionViewController {
    @IBInspectable var imageBaseName:String = ""
    @IBInspectable var repeats:Bool = false
    @IBInspectable var duration:Double = 5.0
    
    override func viewDidLoad() {
        super.imageBaseName_inspect = imageBaseName
        super.repeats_inspect = repeats
        super.duration_inspect = duration
    }
}

class AudioScene: CHAudioPlayViewController {
    @IBInspectable var audioFileName:String = ""
    
    override func viewDidLoad() {
        super.audioFileName_inspect = audioFileName
    }
}

class PagingScene: CHPagingViewController {
    @IBInspectable var imageBaseName : String = ""
    @IBInspectable var pageIndicator : Bool = false
    @IBInspectable var pageSpace : Int = 0
    
    override func viewDidLoad() {
        super.imageBaseName_inspect = imageBaseName
        super.pageIndicator_inspect = pageIndicator
        super.pageSpace_inspect = pageSpace
    }
}

@IBDesignable class RoundButton: RoundRectButton {
    @IBInspectable var corner:Int = 8
    @IBInspectable var border:Int = 2
    
    override func awakeFromNib() {
        super.corner_inspect = corner
        super.border_inspect = border
    }
}

    
public extension UIViewController {
    
    @IBAction func modalDismiss(sender : AnyObject){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func modalDismissPush(sender : AnyObject){
        var destVC : UIViewController! = nil
        if let presentingVC = self.presentingViewController as? UITabBarController {
            if let tempVC = presentingVC.selectedViewController as? UINavigationController {
                destVC = tempVC.topViewController
            } else {
                destVC = self.presentingViewController
            }
        } else if let presentingVC = self.presentingViewController as? UINavigationController {
            destVC = presentingVC.topViewController
        } else {
            destVC = self.presentingViewController
        }
        
        destVC.performSegueWithIdentifier("ModalDismissPush", sender: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    @IBAction func navigationBack(sender : AnyObject){
        if let navigationCongtroller = self.navigationController {
            navigationController?.popViewControllerAnimated(true)
        }
    }
    
    @IBAction func navigationBackToRoot(sender : AnyObject){
        if let navigationCongtroller = self.navigationController {
            navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    
    @IBAction func keyboardDismiss(sender: AnyObject) {
        for view in self.view.subviews {
            view.resignFirstResponder()
        }
    }
    
    @IBAction func openPhotoLibrary(sender: AnyObject) {
        
        let imagePickerController = UIImagePickerController()
        //imagePickerController.delegate = sender
        imagePickerController.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        imagePickerController.allowsEditing = true
        self.presentViewController(imagePickerController, animated: true, completion: { imageP in
            
        })
    }
    
    @IBInspectable var backHidden : Bool {
        get {
            return self.navigationItem.hidesBackButton
        }
        set (newValue){
            //backButtonHidden = newValue
            self.navigationItem.hidesBackButton = newValue
        }
    }
    
    
//    func viewSize() -> CGSize {
//        return self.view.bounds.size
//    }
}
















