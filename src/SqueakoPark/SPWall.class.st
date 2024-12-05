Class {
	#name : #SPWall,
	#superclass : #Morph,
	#instVars : [
		'game'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 17:55'
}
SPWall >> carry: anObject [
	"do nothing"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 17:46'
}
SPWall >> collideWith: anObject velocity: aPoint [
	^ anObject collideWithWall: self velocity: aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 18:23'
}
SPWall >> game [
	^ game
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 18:23'
}
SPWall >> game1: anObject [
	game := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 18:22'
}
SPWall >> game: aGame [
	game := aGame.
	self gmCollisionHandler addCollisionMorph: self.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 18:23'
}
SPWall >> gmCollisionHandler [
	^ self game gmCollisionHandler
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 18:24'
}
SPWall >> initialize [
	super initialize.
	self
		color: Color red;
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 18:09'
}
SPWall >> uncarry: anObject [
	"do nothing"
]
