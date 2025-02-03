Class {
	#name : #SPCyclingPlatform,
	#superclass : #SPMovingPlatform,
	#instVars : [
		'targetNames',
		'targetName'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 2/3/2025 23:36'
}
SPCyclingPlatform >> preMovement [
	self selectTarget.
	super preMovement.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 2/3/2025 23:50'
}
SPCyclingPlatform >> selectTarget [
	| index |
	self targetNames ifEmpty: [self target: self. ^ self].
	index := self targetNames
				indexOf: self targetName
				ifAbsent: [self targetName: self targetNames first. ^ self].
	self target center = self center ifFalse: [^ self].
	index := index + 1.
	index > self targetNames size ifTrue: [index := 1].
	self targetName: (self targetNames at: index).
]

{
	#category : #printing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:50'
}
SPCyclingPlatform >> storedProperties [
	^ super storedProperties, #('targetNames')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:49'
}
SPCyclingPlatform >> target [
	^ self game deepSubpartNamed: (self targetName ifNil: [^ self])
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:49'
}
SPCyclingPlatform >> targetName [
	^ targetName
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:49'
}
SPCyclingPlatform >> targetName: aString [
	targetName := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:50'
}
SPCyclingPlatform >> targetNames [
	^ targetNames
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:50'
}
SPCyclingPlatform >> targetNames: aCollection [
	targetNames := aCollection
]
