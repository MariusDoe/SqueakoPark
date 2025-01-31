Class {
	#name : #SPMovingPlatform,
	#superclass : #SPWall,
	#category : #'SqueakoPark-Core'
}

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/31/2025 12:49'
}
SPMovingPlatform >> cannotMoveTowards: aSymbol [
	| direction velocityTowards |
	direction := SPDirections vector: aSymbol.
	velocityTowards := self velocity dotProduct: direction.
	velocityTowards <= 0 ifTrue: [^ self].
	((self solidsTowards: aSymbol) anySatisfy: #isWall) ifFalse: [^ self].
	self velocity: self velocity - (2 * direction * velocityTowards).
]
