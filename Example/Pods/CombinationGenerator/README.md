# CombinationGenerator

[![Build Status](https://travis-ci.org/fjtrujy/CombinationGenerator.svg?branch=master)](https://travis-ci.org/fjtrujy/CombinationGenerator)
[![Version](https://img.shields.io/cocoapods/v/CombinationGenerator.svg?style=flat)](http://cocoapods.org/pods/CombinationGenerator)
[![License](https://img.shields.io/cocoapods/l/CombinationGenerator.svg?style=flat)](http://cocoapods.org/pods/CombinationGenerator)
[![Platform](https://img.shields.io/cocoapods/p/CombinationGenerator.svg?style=flat)](http://cocoapods.org/pods/CombinationGenerator)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/fjtrujy/CombinationGenerator)](http://clayallsopp.github.io/readme-score?url=https://github.com/fjtrujy/CombinationGenerator)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Is valid for iOS 9 and higher.
Requires Swift 5.0 and XCode 10.0 or higher.

## Installation

CombinationGenerator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CombinationGenerator'
```

## How to use it

CombinationGenerator basically is a helper that use brute-force to generate all possibilities for a concrete DataModel given a list of possible values per property

An example use to be easier to understand than 1000 words.. so, please to see the example use:

```ruby
pod  try 'CombinationGenerator'
```

If you don't have `pod try` installed go to https://github.com/CocoaPods/cocoapods-try to install it.

Inside you will see an example of a ViewController that generate all possbility for the typical UserInfo data model.

In case that you still want to see here the examples, let's give a try.

#### 1. Import CombinationGenerator

```swift
import CombinationGenerator
```

#### 2. Create your Data model

```swift
class UserInfo: NSObject {
    var name: String?
    var surname: String?
    var age: Int?
}
```

#### 3. Instanciate, addCombination and generate Results

```swift
let generator = Generator(baseClass: UserInfo.self)
generator.addCombination(propertyKey: "name", values: ["Tete", "MadMoc", "Pableras", "Trujy"])
generator.addCombination(propertyKey: "surname", values: ["Molon", "Singular", "Friendly"])
generator.addCombination(propertyKey: "age", values: [18, 33, 40])


let possibilities = generator.generateCombinations() as! [UserInfo]
```

#### 4. Results:

In the previous example if we wan't to see the generated output we can do:

```swift
possibilities.forEach { userInfo in
    print(userInfo.name!, userInfo.surname!, userInfo.age!.description)
}
```

And the received output:

```swift
Tete Molon 18
MadMoc Molon 18
Pableras Molon 18
Trujy Molon 18
Tete Molon 33
MadMoc Molon 33
Pableras Molon 33
Trujy Molon 33
Tete Molon 40
MadMoc Molon 40
Pableras Molon 40
Trujy Molon 40
Tete Singular 18
MadMoc Singular 18
Pableras Singular 18
Trujy Singular 18
Tete Singular 33
MadMoc Singular 33
Pableras Singular 33
Trujy Singular 33
Tete Singular 40
MadMoc Singular 40
Pableras Singular 40
Trujy Singular 40
Tete Friendly 18
MadMoc Friendly 18
Pableras Friendly 18
Trujy Friendly 18
Tete Friendly 33
MadMoc Friendly 33
Pableras Friendly 33
Trujy Friendly 33
Tete Friendly 40
MadMoc Friendly 40
Pableras Friendly 40
Trujy Friendly 40
```

![Well Done!](https://raw.githubusercontent.com/fjtrujy/CombinationGenerator/master/wellDone.gif)

## Author

Francisco Javier Trujillo Mata, fjtrujy@gmail.com

## License

CombinationGenerator is available under the MIT license. See the LICENSE file for more info.
