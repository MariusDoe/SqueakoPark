Class {
	#name : #SPBlock,
	#superclass : #SPActor,
	#instVars : [
		'weight',
		'remainingPushDistance'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:54'
}
SPBlock >> canBePushed: aPushRequest [
	self remainingPushDistance > 0 ifFalse: [^ false].
	(aPushRequest
		canBePushed: self
		by: self weight
		of: (self allPushersTowards: aPushRequest direction))
			ifFalse: [^ false].
	^ super canBePushed: aPushRequest
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 1/16/2025 18:19'
}
SPBlock >> initialize [
	super initialize.
	self weight: 1.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/23/2025 10:17'
}
SPBlock >> isBlock [
	^ true
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 14:14'
}
SPBlock >> preMovement [
	super preMovement.
	self remainingPushDistance: self pushSpeed.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 17:56'
}
SPBlock >> pushSpeed [
	^ 2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:55'
}
SPBlock >> pushTowards: aSymbol [
	self remainingPushDistance: self remainingPushDistance - 1.
	super pushTowards: aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:14'
}
SPBlock >> remainingPushDistance [
	^ remainingPushDistance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:14'
}
SPBlock >> remainingPushDistance: anObject [
	remainingPushDistance := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:26'
}
SPBlock >> weight [
	^ weight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:27'
}
SPBlock >> weight: aNumber [
	weight := aNumber
]
