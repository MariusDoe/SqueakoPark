Class {
	#name : #SPCollisionMorph,
	#superclass : #Morph,
	#instVars : [
		'game',
		'pushedBy'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:07'
}
SPCollisionMorph >> game [
	^ game
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:07'
}
SPCollisionMorph >> game: aGame [
	game := aGame.
	self gmCollisionHandler addCollisionMorph: self.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:07'
}
SPCollisionMorph >> gmCollisionHandler [
	^ self game gmCollisionHandler
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 1/16/2025 18:07'
}
SPCollisionMorph >> initialize [
	super initialize.
	self
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		pushedBy: (SPSides withAll: [Set new]).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:59'
}
SPCollisionMorph >> pushedBy [
	^ pushedBy
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:59'
}
SPCollisionMorph >> pushedBy: aDirections [
	pushedBy := aDirections
]
