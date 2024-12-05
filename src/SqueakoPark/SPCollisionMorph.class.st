Class {
	#name : #SPCollisionMorph,
	#superclass : #Morph,
	#instVars : [
		'game'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 19:08'
}
SPCollisionMorph >> carry: anObject [
	"do nothing"
]

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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 19:07'
}
SPCollisionMorph >> gmCollisionHandler [
	^ self game gmCollisionHandler
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 19:07'
}
SPCollisionMorph >> initialize [
	super initialize.
	self gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 19:08'
}
SPCollisionMorph >> uncarry: anObject [
	"do nothing"
]
