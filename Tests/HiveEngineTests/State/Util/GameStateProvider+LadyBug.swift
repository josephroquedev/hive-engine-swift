//
//  GameStateProvider+LadyBug.swift
//  HiveEngineTests
//
//  Created by Joseph Roque on 2020-12-02.
//

@testable import HiveEngine

extension GameState {
	var whiteLadyBug: Unit {
		find(.ladyBug, belongingTo: .white)
	}

	var blackLadyBug: Unit {
		find(.ladyBug, belongingTo: .black)
	}
}

extension GameStateProvider {
	/// Produces a GameState in which the White Lady Bug has a number of interesting moves available
	var whiteLadyBugGameState: GameState {
		let state = GameState()
		self.apply(
			moves: [
				RelativeMovement(notation: "wQ")!,
			],
			to: state
		)
		return state
	}
}
