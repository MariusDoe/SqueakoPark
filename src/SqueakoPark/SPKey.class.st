Class {
	#name : #SPKey,
	#superclass : #SPCollider,
	#instVars : [
		'holder',
		'sprite'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #players,
	#'squeak_changestamp' : 'mad 1/23/2025 14:02'
}
SPKey >> collectedByPlayer: aPlayer [
	self removeFromHolder.
	self holder: aPlayer.
	aPlayer holding add: self.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 14:19'
}
SPKey >> doMovement [
	super doMovement.
	self moveToHolder.
]

{
	#category : #players,
	#'squeak_changestamp' : 'mad 1/23/2025 14:04'
}
SPKey >> handlePlayers [
	self overlappingColliders select: #isPlayer thenDo: [:each | self collectedByPlayer: each].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:00'
}
SPKey >> holder [
	^ holder
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:09'
}
SPKey >> holder: aPlayer [
	holder := aPlayer
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 12/5/2024 19:04'
}
SPKey >> initialize [
	super initialize.
	self
		holder: nil;
		color: Color transparent;
		loadSprite.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/23/2025 17:58'
}
SPKey >> isKey [
	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 12/31/2024 01:33'
}
SPKey >> loadSprite [
	self
		sprite: SPAssets key asMorph;
		extent: self sprite extent;
		addMorphCentered: self sprite.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 12/5/2024 19:16'
}
SPKey >> moveToHolder [
	self holder ifNil: [^ self].
	((self center dist: self holder center) < 75) ifTrue: [^ self].
	self center: (self center interpolateTo: self holder center at: 0.05).
]

{
	#category : #doors,
	#'squeak_changestamp' : 'mad 1/23/2025 14:03'
}
SPKey >> open: aDoor [
	self removeFromHolder.
	aDoor open.
	self delete.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 14:03'
}
SPKey >> postMovement [
	self handlePlayers.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:03'
}
SPKey >> removeFromHolder [
	self holder ifNil: [^ self].
	self holder holding remove: self ifAbsent: [].
	self holder: nil.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:04'
}
SPKey >> sprite [
	^ sprite
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:04'
}
SPKey >> sprite: anObject [
	sprite := anObject
]
