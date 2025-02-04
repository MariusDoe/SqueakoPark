Class {
	#name : #SPGame,
	#superclass : #Morph,
	#instVars : [
		'sceneMorphs'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 00:00'
}
SPGame >> colliders [
	^ self sceneMorphs select: #isCollider
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:47'
}
SPGame >> collidersOverlapping: aRectangle [
	^ self colliders select: [:each | each bounds intersects: aRectangle]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/2/2025 23:50'
}
SPGame >> defaultColor [
	^ Color white
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/24/2025 15:24'
}
SPGame >> doMovement [
	self colliders do: #doMovement.
	[self solids anySatisfy: [:each | each movesDuring: [each tryPush]]] whileTrue.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:52'
}
SPGame >> doPhysics [
	self
		preMovement;
		doMovement;
		postMovement.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 18:03'
}
SPGame >> gmKeyHandler [
	^ self eventHandler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 01:50'
}
SPGame >> initialize [
	super initialize.
	self
		clipSubmorphs: true;
		gmRegisterToKeyHandler;
		sceneMorphs: OrderedCollection new.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mad 2/4/2025 01:47'
}
SPGame >> mouseDown: anEvent [
	"do nothing to prevent GMKeyHandler from throwing an MNU"
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mad 2/4/2025 01:47'
}
SPGame >> mouseMove: anEvent [
	"do nothing to prevent GMKeyHandler from throwing an MNU"
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mad 2/4/2025 01:47'
}
SPGame >> mouseUp: anEvent [
	"do nothing to prevent GMKeyHandler from throwing an MNU"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 00:49'
}
SPGame >> players [
	^ self sceneMorphs select: #isPlayer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:21'
}
SPGame >> postMovement [
	self colliders do: #postMovement.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:52'
}
SPGame >> preMovement [
	self colliders do: #preMovement.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 00:01'
}
SPGame >> sceneMorphs [
	^ sceneMorphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 00:01'
}
SPGame >> sceneMorphs: aCollection [
	sceneMorphs := aCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/24/2025 15:23'
}
SPGame >> solids [
	^ self colliders select: #isSolid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:58'
}
SPGame >> spawn: aSceneMorph [
	aSceneMorph game: self.
	self sceneMorphs add: aSceneMorph.
	self addMorph: aSceneMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 01:40'
}
SPGame >> step [
	self
		doPhysics;
		triggerEvent: #scrollIntoView.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:22'
}
SPGame >> stepTime [
	^ 20
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 01:48'
}
SPGame >> viewRectangle [
	^ ((self players
		collect: #bounds)
		reduce: #merge:)
		outsetBy: 100
]
