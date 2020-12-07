//
//  GameStateProvider+Queen.swift
//  HiveEngineTests
//
//  Created by Joseph Roque on 2020-12-02.
//

@testable import HiveEngine

extension GameState {
	var whiteQueen: Unit {
		find(.queen, belongingTo: .white)
	}

	var blackQueen: Unit {
		find(.queen, belongingTo: .black)
	}
}

extension GameStateProvider {
	/// Produces a GameState in which the White Queen has a number of interesting moves available
	var whiteQueenGameState: GameState {
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
