Class {
	#name : #SPBlock,
	#superclass : #SPFallingSolid,
	#instVars : [
		'weight',
		'remainingPushDistance'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 2/1/2025 23:01'
}
SPBlock >> canBePushedTowards: aSymbol [
	self remainingPushDistance > 0 ifFalse: [^ false].
	((self allPushersTowards: aSymbol) count: #isPlayer)
		>= self weight ifFalse: [^ false].
	^ super canBePushedTowards: aSymbol
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'mad 2/1/2025 22:36'
}
SPBlock >> drawOn: aCanvas [
	| thickness offset reverseOffset squares left top rects |
	thickness := 6.
	offset := thickness / 2.
	reverseOffset := -3 * offset.
	squares := {
		self topLeft + (offset @ offset).
		self topRight + (reverseOffset @ offset).
		self bottomLeft + (offset @ reverseOffset).
		self bottomRight + (reverseOffset @ reverseOffset)}
			collect: [:each | each extent: thickness asPoint].
	left := (self bounds insetBy: 0 @ thickness) withWidth: thickness.
	top := (self bounds insetBy: thickness @ 0) withHeight: thickness.
	rects := {
		left.
		left translateBy: (self width - thickness) @ 0.
		top.
		top translateBy: 0 @ (self height - thickness)}.
	squares, rects do: [:each | aCanvas fillRectangle: each color: self color].
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
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/23/2025 17:56'
}
SPBlock >> pushSpeed [
	^ 2
]

{
	#category : #pushing,
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
	#'squeak_changestamp' : 'mad 1/31/2025 12:30'
}
SPBlock >> remainingPushDistance: aNumber [
	remainingPushDistance := aNumber
]

{
	#category : #printing,
	#'squeak_changestamp' : 'mad 2/3/2025 00:06'
}
SPBlock >> storedProperties [
	^ super storedProperties, #('weight')
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
