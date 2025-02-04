Class {
	#name : #SPGame,
	#superclass : #Morph,
	#instVars : [
		'sceneMorphs'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OB 2/4/2025 01:11'
}
SPGame class >> level1strich1 [
	| game |
	game := self new.
	self
		level1strich1Scene: game;
		level1strich1Customize: game.
	^ game
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OB 2/4/2025 00:55'
}
SPGame class >> level1strich1Customize: aGame [
	"room for customization of the level"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OB 2/4/2025 01:11'
}
SPGame class >> level1strich1Scene: aGame [
	aGame extent: (3368@653).
	aGame spawn: (SPMarker new relativeBounds: (2786@446 corner: 2836@486); knownName: 'unten'; yourself).
	aGame spawn: (SPMarker new relativeBounds: (2782@191 corner: 2832@231); knownName: 'oben'; yourself).
	aGame spawn: (SPWall new relativeBounds: (1450@513 corner: 1647@556); yourself).
	aGame spawn: (SPWeightedPlatform new relativeBounds: (2635@459 corner: 2987@475); speed: 5; weight: 2; originName: 'unten'; goalName: 'oben'; yourself).
	aGame spawn: (SPDoor new relativeBounds: (3162@17 corner: 3354@203); yourself).
	aGame spawn: (SPWall new relativeBounds: (2991@204 corner: 3368@609); yourself).
	aGame spawn: (SPSinglePressButton new relativeBounds: (2225@508 corner: 2273@535); yourself).
	aGame spawn: (SPKey new relativeBounds: (2429@10 corner: 2481@118); yourself).
	aGame spawn: (SPWall new relativeBounds: (2129@535 corner: 3369@652); yourself).
	aGame spawn: (SPCyclingPlatform new relativeBounds: (1787@535 corner: 2153@554); speed: 5; targetNames: #(); yourself).
	aGame spawn: (SPWall new relativeBounds: (1207@326 corner: 1356@457); yourself).
	aGame spawn: (SPWall new relativeBounds: (1075@447 corner: 1355@554); yourself).
	aGame spawn: (SPPlayer new relativeBounds: (242@450 corner: 322@546); id: 2; yourself).
	aGame spawn: (SPPlayer new relativeBounds: (104@451 corner: 184@547); id: 1; yourself).
	aGame spawn: (SPWall new relativeBounds: (843@547 corner: 1354@655); yourself).
	aGame spawn: (SPWall new relativeBounds: (-12@6 corner: 49@581); yourself).
	aGame spawn: (SPWall new relativeBounds: (-11@550 corner: 664@664); yourself).

]

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
	#'squeak_changestamp' : 'mad 2/4/2025 00:00'
}
SPGame >> initialize [
	super initialize.
	self
		gmRegisterToKeyHandler;
		sceneMorphs: OrderedCollection new.
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
