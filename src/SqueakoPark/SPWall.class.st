Class {
	#name : #SPWall,
	#superclass : #SPCollisionMorph,
	#category : #'SqueakoPark-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/30/2024 23:45'
}
SPWall >> collideWithPlayer: aPlayer velocity: aPoint [
	^ aPlayer collideWithImmovable: self velocity: aPoint
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 19:08'
}
SPWall >> initialize [
	super initialize.
	self color: Color red.
]
