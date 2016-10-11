//
//  ViewController.swift
//  UIKitMemoryTests
//
//  Created by Marco Pappalardo on 11/10/16.
//  Copyright © 2016 Marco Pappalardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainStackView = UIStackView()
  var theLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(mainStackView)
    mainStackView.axis = UILayoutConstraintAxis.Vertical
    mainStackView.distribution = UIStackViewDistribution.FillEqually

    // Creates a Label
    theLabel = UILabel()
    theLabel.textAlignment = .Center
    theLabel.text = "FIRST LABEL"
    mainStackView.addArrangedSubview(theLabel)
    print(mainStackView.subviews)
    // [<UILabel: 0x7fdc32d16150; frame = (0 0; 0 0); text = 'FIRST LABEL'; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x7fdc32e56020>>]

    // Let's change the text of the label
    theLabel.text = "CHANGED FIRST LABEL"
    // The UI is correctly edited!
    print(mainStackView.subviews)
    // [<UILabel: 0x7fdc32d16150; frame = (0 0; 0 0); text = 'CHANGED FIRST LABEL'; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x7fdc32e56020>>]



    // HERE HERE!!!
    // Let's replace the UILabel with a new one!
    // Does this only change test as a pointer but does not impact the first one

    print(unsafeAddressOf(theLabel))
    // 0x00007fdc32d16150

    let theLabelPointerCopy = theLabel

    theLabel = UILabel()
    theLabel.text = "Second Label"
    print(unsafeAddressOf(theLabel))
    // 0x00007fdc32e5b560
    print(unsafeAddressOf(theLabelPointerCopy))
    // 0x00007fdc32d16150

    print(mainStackView.subviews)
    // Same as before
    // [<UILabel: 0x7fdc32d16150; frame = (0 0; 0 0); text = 'CHANGED FIRST LABEL'; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x7fdc32e56020>>]

    theLabelPointerCopy.text = "I Can still change what it is in the view"


  }

  override func viewDidLayoutSubviews()
  {
    super.viewDidLayoutSubviews()

    let top = topLayoutGuide.length
    let bottom = bottomLayoutGuide.length

    mainStackView.frame = CGRect(x: 0, y: top, width: view.frame.width, height: view.frame.height - top - bottom)
    
  }


}

