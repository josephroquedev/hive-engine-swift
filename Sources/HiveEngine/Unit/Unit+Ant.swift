//
//  Unit+Ant.swift
//  HiveEngine
//
//  Created by Joseph Roque on 2019-02-08.
//  Copyright © 2019 Joseph Roque. All rights reserved.
//

import Foundation

extension Unit {
	func movesAsAnt(in state: GameState, moveSet: inout Set<Movement>) {
		guard self.canMove(in: state),
			self.canCopyMoves(of: .ant, in: state),
			let position = state.unitsInPlay[owner]?[self] else {
			return
		}

		state.temporarilyRemove(unit: self)
		let playablePositions = state.allPlayablePositions

		var visited: Set<Position> = []
		var toVisit = [position]

		while !toVisit.isEmpty {
			let currentPosition = toVisit.popLast()!
			visited.insert(currentPosition)

			// Only consider valid playable positions that can be reached
			for adjacentPosition in currentPosition.adjacent() {
					// Is adjacent to another piece and the position has not already been explored
				guard playablePositions.contains(adjacentPosition) && !visited.contains(adjacentPosition),
					// The new position shares at least 1 adjacent unit with a previous space
					let commonPositions = currentPosition.commonPositions(to: adjacentPosition),
					state.stacks[commonPositions.0] != nil || state.stacks[commonPositions.1] != nil,
					// The piece can freely move to the new position
					currentPosition.freedomOfMovement(to: adjacentPosition, in: state) else { continue }

				toVisit.append(adjacentPosition)
				moveSet.insert(.move(unit: self, to: adjacentPosition))
			}
		}

		state.replaceRemovedUnit()
	}
}
