# ModuleServices

![CI](https://github.com/cosmicfools/ModuleServices/workflows/CI/badge.svg)
[![Version](https://img.shields.io/cocoapods/v/ModuleServices.svg?style=flat)](http://cocoapods.org/pods/ModuleServices)
[![License](https://img.shields.io/cocoapods/l/ModuleServices.svg?style=flat)](http://cocoapods.org/pods/ModuleServices)
[![Platform](https://img.shields.io/cocoapods/p/ModuleServices.svg?style=flat)](http://cocoapods.org/pods/ModuleServices)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/cosmicfools/moduleservices)](http://clayallsopp.github.io/readme-score?url=https://github.com/cosmicfools/moduleservices)

## Requirements

Is valid for iOS 9 and higher.
Requires Swift 5.2 and XCode 11.0 or higher.

## Installation

### Swift Package Manager

You can install CombinationGenerator via [Swift Package Manager](https://swift.org/package-manager/) by adding the following line to your `Package.swift`:

```swift
import PackageDescription

let package = Package(
    [...]
    dependencies: [
        .Package(name: "ModuleServices", url: "https://github.com/cosmicfools/ModuleServices.git", .branch("master"))
    ]
)
```

### Cocoapods

You can install CombinationGenerator via [Cocoapods](https://cocoapods.org/) by adding the following line to your `Podfile`:

```ruby
pod 'ModuleServices'
```

## How to use it

ModuleServices basically is a pack of tools that is helping you to develop faster. This libabry is so useful for those UIViewControllers that are based in UITableView.
The main concept in this libary is, a Module means a Section in a UITableView, so there is a subclass of UIViewController called ModulesViewController that manage all modules.

A Module is a like and mini UIViewController, should be able to work it self.

Basically a ModulesViewController has an array of TableSectionModules.

Sometimes an example is easier to understand than 1000 words.. so, we have an additionaly repository full of examples:
[Module-examples](https://github.com/fjtrujy/module-examples)


![Let me give it a try](https://raw.githubusercontent.com/cosmicfools/ModuleServices/master/giveATry.jpg)

#### 1. Create a Module
You need to create a subclass of `TableSectionModule`

```swift
class FirstSectionModule: TableSectionModule {}
```

#### 2. Override the needed methods in the Module
There are a lot of methods that could be override. The most usuals are: 

* Registration of `UITableViewCell`/`UITableViewHeaderFooterView` with `Class`/`Nib`
```swift
override func registerClassForCells() -> [AnyClass]
override func registerClassForHeadersFooters() -> [AnyClass]
override func registerNibsForCells() -> [AnyClass] 
override func registerNibsForHeadersFooters() -> [AnyClass] 
```

* Creation of rows, this is the like the data source of the `UITableView`
```swift
override func createRows()
```

* Dequeue and configure of the `UITableViewCell`
```swift
override func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
```
* Rest of method that could be override
You can override basically the same method that the `UITableViewDelegate` and `UITableViewDataSource` offer.

* Obviously you will need to create&configure all the `UITableViewCells` that the Module would contains.
<br><br>
###### Example of `TableSectionModule` with methods
<br>

```swift
import ModuleServices

class FirstSectionModule: TableSectionModule {
    override func registerNibsForCells() -> [AnyClass] {
        return super.registerNibsForCells() + [
            Example1TableViewCell.classForCoder(),
        ]
    }
    
    override func registerClassForCells() -> [AnyClass] {
        super.registerClassForCells() + [UITableViewCell.classForCoder()]
    }
    
    override func createRows() {
        super.createRows()
        
        rows.append(String(describing: Example1TableViewCell.self))
        rows.append(String(describing: UITableViewCell.self))
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: className, for: indexPath)
        
        let className = rows[(indexPath as NSIndexPath).row] as! String
        //Addtional configuration for the cell
        switch className {
        case String(describing: UITableViewCell.self):
            cell.textLabel?.text = "A tottally native cell"
            break
        default:
            break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 44.0
}
```

<br><br>
#### 3. Create a ModulesViewController
You need to create a subclass of `ModulesViewController`
```swift
class MyViewController: ModulesViewController {}
```

#### 4. Override the needed methods in the ViewController
The methods to be override in the `ModulesViewController` are less than on the `Modules`. Usually is just needed to override the `createModules`

```swift
override func createModules()
```
This method will add all the modules that the view controller could have. Like this example:

```swift
override func createModules() {
        super.createModules()
        
        appendModule(FirstSectionModule(tableView: tableView!))
    }
```

<br>

###### Example of `ModulesViewController` with methods
<br>

```swift
import ModuleServices

class MyViewController: ModulesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 44
        
        tableView?.tableFooterView = UIView()
    }

    override func createModules() {
        super.createModules()
        
        appendModule(FirstSectionModule(tableView: tableView!))
    }

}

```
<br><br><br>
As could appreciate this is a very good approach to avoid masive view controllers. The main idea is to split responsabilities. 

- A `ModulesViewController` will manage (add/remove) `TableSectionModule`
- A `TableSectionModule` will manage the cells that the section itself will contains
- A `TableSectionModule` could contain enough logic & responsability how to make it fully work that section of the `UITableView`

<br><br>
##### Enjoy and be module my developer! :godmode:
<br><br>
## Author

Francisco Javier Trujillo Mata, fjtrujy@gmail.com

## License

ModuleServices is available under the MIT license. See the LICENSE file for more info.
