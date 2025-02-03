Class {
	#name : #SPMovingPlatform,
	#superclass : #SPWall,
	#instVars : [
		'speed'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:44'
}
SPMovingPlatform class >> isAbstract [
	^ self == SPMovingPlatform
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 2/3/2025 23:21'
}
SPMovingPlatform >> calculateVelocity [
	| delta |
	delta := self target center - self center.
	delta = (0 @ 0) ifTrue: [^ self velocity: delta].
	self velocity: delta normalized * (delta r clampHigh: self speed).
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 2/3/2025 23:40'
}
SPMovingPlatform >> initialize [
	super initialize.
	self speed: 5.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 2/3/2025 23:36'
}
SPMovingPlatform >> preMovement [
	self calculateVelocity.
	super preMovement.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:07'
}
SPMovingPlatform >> speed [
	^ speed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:07'
}
SPMovingPlatform >> speed: aNumber [
	speed := aNumber
]

{
	#category : #printing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:45'
}
SPMovingPlatform >> storedProperties [
	^ super storedProperties, #('speed')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:35'
}
SPMovingPlatform >> target [
	self subclassResponsibility.
]
