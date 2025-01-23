Class {
	#name : #SPGame,
	#superclass : #Morph,
	#instVars : [
		'colliders'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:26'
}
SPGame >> actors [
	^ self colliders select: #isActor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:26'
}
SPGame >> colliders [
	^ colliders
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:26'
}
SPGame >> colliders: anObject [
	colliders := anObject
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
	#'squeak_changestamp' : 'mad 1/23/2025 14:21'
}
SPGame >> doMovement [
	self colliders do: #doMovement.
	[self actors anySatisfy: [:each | each movesDuring: [each tryMove]]] whileTrue.
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
	#'squeak_changestamp' : 'mad 1/23/2025 15:00'
}
SPGame >> initialize [
	super initialize.
	self
		gmRegisterToKeyHandler;
		colliders: OrderedCollection new;
		color: Color white;
		extent: 500 @ 400;
		spawnWallAt: (0 @ 300 corner: 500 @ 400);
		spawnDoorAt: (400 @ 100 corner: 500 @ 299);
		spawnPlayerAt: 100 @ 100 keyMap: SPKeyMap wasd colorAngle: 0;
		spawnPlayerAt: 300 @ 100 keyMap: SPKeyMap arrowKeys colorAngle: 100;
		spawnKeyAt: 200 @ 250;
		spawnBlockAt: (200 @ 100 extent: 50 @ 50) weight: 2.
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
	#'squeak_changestamp' : 'mad 1/23/2025 14:22'
}
SPGame >> spawn: aCollider [
	aCollider game: self.
	self colliders add: aCollider.
	self addMorph: aCollider.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 15:00'
}
SPGame >> spawnBlockAt: aRectangle weight: aNumber [
	self spawn: (SPBlock new bounds: aRectangle; weight: aNumber; yourself).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 12:29'
}
SPGame >> spawnDoorAt: aRectangle [
	self spawn: (SPDoor new bounds: aRectangle; yourself).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 12:29'
}
SPGame >> spawnKeyAt: aPoint [
	self spawn: (SPKey new position: aPoint; yourself).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:28'
}
SPGame >> spawnPlayerAt: aPoint keyMap: aKeyMap colorAngle: aNumber [
	self spawn: (SPPlayer new
						position: aPoint;
						keyMap: aKeyMap;
						loadSprite: aNumber;
						yourself).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 12:30'
}
SPGame >> spawnWallAt: aRectangle [
	self spawn: (SPWall new bounds: aRectangle; yourself).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:02'
}
SPGame >> step [
	self doPhysics.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:22'
}
SPGame >> stepTime [
	^ 20
]
