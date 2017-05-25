# RHActivityIndicatorDialog

[![Swift: 3.1](https://img.shields.io/badge/Swift-3.1-blue.svg)](https://swift.org)
[![License: Modified BSD](https://img.shields.io/badge/License-Modified%20BSD-red.svg)]()
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

A simple framework for creating a "busy" dialog view for iOS apps.

## Example

<a href="http://imgur.com/IrvrwTB"><img src="http://i.imgur.com/IrvrwTB.gif" title="source: imgur.com" /></a>

## Features

* Create a dialog view with a stock UIActivityIndicator and text
* Dark (default) and light styles

## Installation

Carthage:

1. Create a Cartfile in your project root
2. Add the following to the Cartfile:
    `github "rharri/RHActivityIndicatorDialog"`
3. Run carthage update
4. Add the RHActivityIndicatorDialog.framework to your project under General -> Linked Frameworks and Libraries 
(The framework is located in the Carthage/Build/iOS folder)
5. Select Build Phases
6. Click the + button and select "New Run Script Phase"
7. Add the following command:
    `/usr/local/bin/carthage copy-frameworks`
8. Under "Input files", add the following:
    `$(SRCROOT)/Carthage/Build/iOS/RHActivityIndicatorDialog.framework`

You are now ready to use the RHActivityIndicatorDialog!

## How to use

Display a dialog with a dark style and the text "Turning Off Reminders..." 

```Swift
import RHActivityIndicatorDialog

...

override func viewDidLoad() {
    super.viewDidLoad()
    
    let dialog = RHActivityIndicatorDialog(text: "Turning Off Reminders...")
    
    self.view.addSubview(dialog)
}

...

```

Display a dialog with a light style and the text "Loading..."

```Swift
import RHActivityIndicatorDialog

...

override func viewDidLoad() {
    super.viewDidLoad()

    let dialog = RHActivityIndicatorDialog(text: "Loading...", style: .light)

    self.view.addSubview(dialog)
}

...

```

## Sample Project

https://github.com/rharri/RHActivityIndicatorDialogExample

## Collaboration

Feel free to colloborate!

Submit:

* Ideas
* Issues
* Pull Requests

## License

Modified BSD License

Copyright (c) 2017-Present, Ryan Harri. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

* Neither the name Ryan Harri nor the names of its contributors may be used
to endorse or promote products derived from this software without specific prior
written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
