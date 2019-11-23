//
//  ViewController.swift
//  ios-exam-3
//
//  Created by liushangwei on 2019/11/17.
//  Copyright © 2019 zhouhaijian. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var buleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var count: UILabel!
    var countNumber = 0
    var rect:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        redButton.backgroundColor = .red
        redButton.setTitle("",for: .normal)
        buleButton.backgroundColor = .blue
        buleButton.setTitle("",for: .normal)
        greenButton.backgroundColor = .green
        greenButton.setTitle("",for: .normal)
    
        rect = UIView(frame:CGRect(x:0, y:0, width:200, height:100))
        rect.center = self.view.center
        rect.backgroundColor = UIColor.orange
        rect.layer.cornerRadius = 16
        view.addSubview(rect)
    
         let pan = UIPanGestureRecognizer(target:self,action:#selector(panDid(_:)))
        pan.maximumNumberOfTouches = 1
        rect.addGestureRecognizer(pan)
        
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(rotationGesture(_:)))

        rect.addGestureRecognizer(rotation)
        
        rect.isMultipleTouchEnabled = true
        let moreTap = UITapGestureRecognizer.init(target:self, action: #selector(handleMoreTap(tap:)))
                
        moreTap.numberOfTapsRequired = 2//触发响应的点击次数
        
        rect.addGestureRecognizer(moreTap)
        
    }
    @objc func handleMoreTap(tap:UITapGestureRecognizer) {
        rect.center = self.view.center
    }
    @objc func panDid(_ recognizer:UISwipeGestureRecognizer){
           let point=recognizer.location(in: self.view)
           //设置矩形的位置
           rect.center=point
    }
    @objc func rotationGesture(_ rotationGesture: UIRotationGestureRecognizer) {
        let r = rotationGesture.rotation*(180/(CGFloat(Double.pi))) ;
        print(rotationGesture.rotation*(180/(CGFloat(Double.pi))))// 旋转的角度
        self.rect.transform = CGAffineTransform(rotationAngle: r)
    }
    @IBAction func redAction(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 3, options: .curveLinear, animations: {
            
            self.rect.backgroundColor = .red
            self.countNumber+=1
            self.count.text = "count:\(self.countNumber)"
            
        },completion: nil)
    }
    
    @IBAction func buleAction(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 3, options: .curveLinear, animations: {
            
         self.rect.backgroundColor = .blue
        self.countNumber+=1
        self.count.text = "count:\(self.countNumber)"
        }, completion: nil)
    }
    @IBAction func greenAction(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 3, options: .curveLinear, animations: {
            
          self.rect.backgroundColor = .green
        self.countNumber+=1
        self.count.text = "count:\(self.countNumber)"
        }, completion: nil)
    }

}

/**
 /获取弧度
 var rad:CGFloat=sender.rotation
 //计算角度
 var angle:Double=Double（rad）*180/M_PI
 //图片旋转
 img.transform=CGAffine TransformMakeRotation（rad）
 println（”旋转角度=（angle）"）
 */
