//
//  SuperDelegate+LocationEventsTests.swift
//  SuperDelegate
//
//  Created by Dan Federman on 4/18/16.
//  Copyright © 2016 Square, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import XCTest
@testable import SuperDelegate


class SuperDelegateLocationEventsTests: SuperDelegateTests {
    
    
    // MARK: - Behavioral Tests
    
    
    func test_applicationDidFinishLaunching_notifiesAboutLocationEvent() {
        let locationEventsCapableDelegate = LocationEventsCapableDelegate()
        XCTAssertTrue(locationEventsCapableDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: [UIApplicationLaunchOptionsKey.location : true]))
        XCTAssertTrue(locationEventsCapableDelegate.appLaunchedDuetoLocationEvent)
    }
    
    
    func test_applicationWillFinishLaunching_doesNotNotifyAboutLocationEvent() {
        let locationEventsCapableDelegate = LocationEventsCapableDelegate()
        XCTAssertTrue(locationEventsCapableDelegate.application(UIApplication.shared, willFinishLaunchingWithOptions: [UIApplicationLaunchOptionsKey.location : true]))
        XCTAssertFalse(locationEventsCapableDelegate.appLaunchedDuetoLocationEvent)
    }
}


// MARK: - LocationEventsCapableDelegate


class LocationEventsCapableDelegate: AppLaunchedDelegate, LocationEventCapable {
    var appLaunchedDuetoLocationEvent = false
    func applicationLaunchedDueToLocationEvent() {
        appLaunchedDuetoLocationEvent = true
    }
}
