Class {
	#name : #SPWeightedPlatform,
	#superclass : #SPMovingPlatform,
	#instVars : [
		'weight',
		'originName',
		'goalName',
		'label'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 2/4/2025 00:35'
}
SPWeightedPlatform >> addSign [
	| postHeight topCenter |
	topCenter := 0.5 @ 0 corner: 0.5 @ 0.
	postHeight := 30.
	self
		layoutPolicy: ProportionalLayout new;
		addMorph: (Morph new color: self sceneColor; yourself)
		fullFrame: (LayoutFrame
						fractions: topCenter
						offsets: (-10 @ postHeight negated corner: 10 @ 0));
		addMorph: (SPRoundedRectangle new
						color: self sceneColor;
						layoutPolicy: TableLayout new;
						listCentering: #center;
						wrapCentering: #center;
						addMorph: self label;
						yourself)
		fullFrame: (LayoutFrame
						fractions: topCenter
						offsets: (-70 @ (postHeight negated - 60) corner: 70 @ postHeight negated)).
]

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
	#'squeak_changestamp' : 'mad 2/4/2025 00:34'
}
SPWeightedPlatform >> initialize [
	super initialize.
	self
		label: (StringMorph new color: self sceneColor; yourself);
		addSign;
		weight: 1.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 00:33'
}
SPWeightedPlatform >> isActive [
	^ self pushingWeight >= self weight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 00:26'
}
SPWeightedPlatform >> label [
	^ label
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 00:26'
}
SPWeightedPlatform >> label: anObject [
	label := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 00:34'
}
SPWeightedPlatform >> missingWeight [
	^ self weight - self pushingWeight clampLow: 0
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
	#category : #movement,
	#'squeak_changestamp' : 'mad 2/4/2025 00:32'
}
SPWeightedPlatform >> postMovement [
	super postMovement.
	self label contents: self missingWeight asString.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 00:33'
}
SPWeightedPlatform >> pushingWeight [
	^ (self pushersTowards at: #bottom) size
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
	#'squeak_changestamp' : 'mad 2/4/2025 00:33'
}
SPWeightedPlatform >> weight: aNumber [
	weight := aNumber.
	self label contents: self weight asString.
]
