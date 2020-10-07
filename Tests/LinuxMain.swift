import XCTest

import ModulesKitTests
import ModulesKitSnapshotTests

var tests = [XCTestCaseEntry]()
tests += ModulesKitTests.allTests()
tests += ModulesKitSnapshotTests.allTests()
XCTMain(tests)
