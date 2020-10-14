import XCTest

import ModuleServicesTests
import ModuleSnapshotServicesTests

var tests = [XCTestCaseEntry]()
tests += ModuleServicesTests.allTests()
tests += ModuleSnapshotServicesTests.allTests()
XCTMain(tests)
