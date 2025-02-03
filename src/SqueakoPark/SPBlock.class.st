Class {
	#name : #SPBlock,
	#superclass : #SPFallingSolid,
	#instVars : [
		'weight',
		'remainingPushDistance',
		'label'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 2/1/2025 23:21'
}
SPBlock >> canBePushedTowards: aSymbol [
	self remainingPushDistance > 0 ifFalse: [^ false].
	(self playerCountPushingTowards: aSymbol) >= self weight ifFalse: [^ false].
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
	#'squeak_changestamp' : 'mad 2/2/2025 23:54'
}
SPBlock >> initialize [
	super initialize.
	self
		label: (StringMorph new color: self color; yourself);
		addMorph: self label;
		layoutPolicy: TableLayout new;
		listCentering: #center;
		wrapCentering: #center;
		weight: 1.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/23/2025 10:17'
}
SPBlock >> isBlock [
	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/1/2025 23:26'
}
SPBlock >> label [
	^ label
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 02:04'
}
SPBlock >> label: aStringMorph [
	label := aStringMorph
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 2/1/2025 23:23'
}
SPBlock >> missingPushCount [
	| delta |
	delta := (self playerCountPushingTowards: #right) - (self playerCountPushingTowards: #left).
	^ self weight - delta abs clampLow: 0
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 2/1/2025 23:22'
}
SPBlock >> playerCountPushingTowards: aSymbol [
	^ (self allPushersTowards: aSymbol) count: #isPlayer
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 2/1/2025 23:22'
}
SPBlock >> postMovement [
	super postMovement.
	self label contents: self missingPushCount asString.
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
	#'squeak_changestamp' : 'mad 2/2/2025 23:54'
}
SPBlock >> weight: aNumber [
	weight := aNumber.
	self label contents: self weight asString.
]
