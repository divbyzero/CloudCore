//
//  CKRecordID.swift
//  CloudCore
//
//  Created by Vasily Ulianov on 01.03.17.
//  Copyright © 2017 Vasily Ulianov. All rights reserved.
//

import XCTest
import CloudKit

@testable import CloudCore

class CKRecordIDTests: XCTestCase {
	func testRecordIDEncodeDecode() {
		let zoneID = CKRecordZone.ID(zoneName: CloudCore.config.zoneID.zoneName, ownerName: CKCurrentUserDefaultName)
		let recordID = CKRecord.ID(recordName: "testName", zoneID: zoneID)
		
		let encodedString = recordID.encodedString
		let restoredRecordID = CKRecord.ID(encodedString: encodedString)
		
		XCTAssertEqual(recordID.recordName, restoredRecordID?.recordName)
		XCTAssertEqual(recordID.zoneID, restoredRecordID?.zoneID)
		
	}
}
