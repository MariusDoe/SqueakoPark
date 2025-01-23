Class {
	#name : #SPPlayerSprite,
	#superclass : #ImageMorph,
	#instVars : [
		'myPlayer',
		'hue',
		'isJumping',
		'isPushing',
		'direction',
		'facing',
		'cycleIndex'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/31/2024 00:37'
}
SPPlayerSprite >> basicDirection: aNumber [
	direction := aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/31/2024 00:37'
}
SPPlayerSprite >> basicIsJumping: aBoolean [
	isJumping := aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/31/2024 00:25'
}
SPPlayerSprite >> cycleIndex [
	^ cycleIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/31/2024 00:25'
}
SPPlayerSprite >> cycleIndex: aNumber [
	cycleIndex := aNumber
]

{
	#category : #cycling,
	#'squeak_changestamp' : 'mad 12/31/2024 00:39'
}
SPPlayerSprite >> cycleLength [
	^ self mode caseOf: {
		[#stand] -> [1].
		[#walk] -> [4].
		[#jump] -> [1].
		[#push] -> [4].
		[#dead] -> [1].
	}
]

{
	#category : #modes,
	#'squeak_changestamp' : 'mad 12/31/2024 00:34'
}
SPPlayerSprite >> dead [
	self image: (SPAssets picocatDeadWithHue: self hue).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/31/2024 00:34'
}
SPPlayerSprite >> direction [
	^ direction
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/31/2024 00:37'
}
SPPlayerSprite >> direction: aNumber [
	self restartOnModeChange: [
		self basicDirection: aNumber.
		aNumber < 0 ifTrue: [self facing: #left].
		aNumber > 0 ifTrue: [self facing: #right]].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/31/2024 00:35'
}
SPPlayerSprite >> facing [
	^ facing
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/31/2024 00:35'
}
SPPlayerSprite >> facing: aSymbol [
	facing := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/31/2024 00:05'
}
SPPlayerSprite >> hue [
	^ hue
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/31/2024 00:05'
}
SPPlayerSprite >> hue: aNumber [
	hue := aNumber
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 12/31/2024 00:39'
}
SPPlayerSprite >> initialize [
	super initialize.
	self
		basicDirection: 0;
		facing: #right;
		basicIsJumping: false;
		resetCycleIndex.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/31/2024 00:33'
}
SPPlayerSprite >> isJumping [
	^ isJumping
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/31/2024 00:37'
}
SPPlayerSprite >> isJumping: aBoolean [
	self restartOnModeChange: [self basicIsJumping: aBoolean].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 09:19'
}
SPPlayerSprite >> isPushing [
	^ isPushing
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 09:19'
}
SPPlayerSprite >> isPushing: aBoolean [
	isPushing := aBoolean
]

{
	#category : #modes,
	#'squeak_changestamp' : 'mad 12/31/2024 00:27'
}
SPPlayerSprite >> jump [
	self image: (SPAssets picocatJumpingFacing: self facing hue: self hue).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 09:19'
}
SPPlayerSprite >> mode [
	self isJumping ifTrue: [^ #jump].
	self direction = 0 ifTrue: [^ #stand].
	self isPushing ifTrue: [^ #push].
	^ #walk
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/30/2024 23:53'
}
SPPlayerSprite >> myPlayer [
	"avoid naming collisions with e-toys' player"
	^ myPlayer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/30/2024 23:53'
}
SPPlayerSprite >> myPlayer: aPlayer [
	myPlayer := aPlayer
]

{
	#category : #cycling,
	#'squeak_changestamp' : 'mad 12/31/2024 00:24'
}
SPPlayerSprite >> nextCycleIndex [
	self cycleIndex: self cycleIndex + 1.
	self cycleIndex > self cycleLength ifTrue: [self resetCycleIndex].
]

{
	#category : #modes,
	#'squeak_changestamp' : 'mad 12/31/2024 00:26'
}
SPPlayerSprite >> push [
	self image: (SPAssets picocatPushing: self cycleIndex facing: self facing hue: self hue).
]

{
	#category : #cycling,
	#'squeak_changestamp' : 'mad 12/31/2024 00:24'
}
SPPlayerSprite >> resetCycleIndex [
	self cycleIndex: 1.
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'mad 12/31/2024 00:24'
}
SPPlayerSprite >> restart [
	self
		resetCycleIndex;
		updateImage;
		startStepping.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/31/2024 00:32'
}
SPPlayerSprite >> restartOnModeChange: aBlock [
	| oldMode |
	oldMode := self mode.
	aBlock ensure: [self mode = oldMode ifFalse: [self restart]].
]

{
	#category : #modes,
	#'squeak_changestamp' : 'mad 12/31/2024 00:06'
}
SPPlayerSprite >> stand [
	self image: (SPAssets picocatStandingFacing: self facing hue: self hue).
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'mad 12/31/2024 00:23'
}
SPPlayerSprite >> step [
	self
		updateImage;
		nextCycleIndex.
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'mad 12/31/2024 00:49'
}
SPPlayerSprite >> stepTime [
	^ 100
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'mad 12/31/2024 00:21'
}
SPPlayerSprite >> updateImage [
	self perform: self mode.
]

{
	#category : #modes,
	#'squeak_changestamp' : 'mad 12/31/2024 00:26'
}
SPPlayerSprite >> walk [
	self image: (SPAssets picocatWalking: self cycleIndex facing: self facing hue: self hue).
]
