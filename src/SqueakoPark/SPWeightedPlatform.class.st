Class {
	#name : #SPWeightedPlatform,
	#superclass : #SPMovingPlatform,
	#instVars : [
		'weight',
		'originName',
		'goalName'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:47'
}
SPWeightedPlatform >> goalName [
	^ goalName
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:47'
}
SPWeightedPlatform >> goalName: aString [
	goalName := aString
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 2/3/2025 23:39'
}
SPWeightedPlatform >> initialize [
	super initialize.
	self weight: 1.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 00:01'
}
SPWeightedPlatform >> isActive [
	^ (self pushersTowards at: #bottom) size >= self weight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:47'
}
SPWeightedPlatform >> originName [
	^ originName
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:47'
}
SPWeightedPlatform >> originName: aString [
	originName := aString
]

{
	#category : #printing,
	#'squeak_changestamp' : 'mad 2/4/2025 00:03'
}
SPWeightedPlatform >> storedProperties [
	^ super storedProperties, #('weight' 'originName' 'goalName')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:46'
}
SPWeightedPlatform >> target [
	| targetName |
	targetName := self isActive ifTrue: [self goalName] ifFalse: [self originName].
	targetName ifNil: [^ self].
	^ self game deepSubpartNamed: targetName
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:38'
}
SPWeightedPlatform >> weight [
	^ weight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:38'
}
SPWeightedPlatform >> weight: aNumber [
	weight := aNumber
]
