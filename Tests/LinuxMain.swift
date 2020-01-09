import XCTest

import battleshipTests

var tests = [XCTestCaseEntry]()
tests += battleshipTests.allTests()
XCTMain(tests)
