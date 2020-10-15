import XCTest

import ModuleServicesTests
import ModuleSnapshotServicesTests
import ModuleGenericServices

var tests = [XCTestCaseEntry]()
tests += ModuleServicesTests.allTests()
tests += ModuleSnapshotServicesTests.allTests()
tests += ModuleGenericServices.allTests()
XCTMain(tests)
