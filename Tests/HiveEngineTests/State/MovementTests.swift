//
//  MovementTests.swift
//  HiveEngineTests
//
//  Created by Joseph Roque on 2019-02-11.
//  Copyright © 2019 Joseph Roque. All rights reserved.
//

import Foundation
import XCTest
@testable import HiveEngine

final class MovementTests: HiveEngineTestCase {

	func testCodingMoveMovement() {
		let unit = Unit(class: .ant, owner: .white, identifier: UUID(uuidString: "AACA052C-280E-4925-8488-518770A2A912")!)
		let position: Position = .inPlay(x: 1, y: -1, z: 0)
		let movement: Movement = .move(unit: unit, to: position)
		XCTAssertEncodable(movement)
		XCTAssertDecodable(movement)
	}

	func testCodingYoinkMovement() throws {
		let pillBug = Unit(class: .pillBug, owner: .black, identifier: UUID(uuidString: "97957797-CC2B-4673-A079-2C75C378361F")!)
		let unit = Unit(class: .ant, owner: .white, identifier: UUID(uuidString: "AACA052C-280E-4925-8488-518770A2A912")!)
		let position: Position = .inPlay(x: 1, y: -1, z: 0)
		let movement: Movement = .yoink(pillBug: pillBug, unit: unit, to: position)
		XCTAssertEncodable(movement)
		XCTAssertDecodable(movement)
	}

	func testCodingPlaceMovement() throws {
		let unit = Unit(class: .ant, owner: .white, identifier: UUID(uuidString: "AACA052C-280E-4925-8488-518770A2A912")!)
		let position: Position = .inPlay(x: 1, y: -1, z: 0)
		let movement: Movement = .place(unit: unit, at: position)
		XCTAssertEncodable(movement)
		XCTAssertDecodable(movement)
	}

	static var allTests = [
		("testCodingMoveMovement", testCodingMoveMovement),
		("testCodingYoinkMovement", testCodingYoinkMovement),
		("testCodingPlaceMovement", testCodingPlaceMovement)
	]
}
