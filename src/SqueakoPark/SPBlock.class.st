Class {
	#name : #SPBlock,
	#superclass : #SPMovingCollisionMorph,
	#instVars : [
		'weight'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:48'
}
SPBlock >> currentVelocity [
	^ self velocity + self pushVelocity
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
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:25'
}
SPBlock >> pushCountDiff [
	^ (self pushCountFrom: #left) - (self pushCountFrom: #right)
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/23/2025 09:30'
}
SPBlock >> pushCountFrom: aSymbol [
	| pushing queue |
	queue := OrderedCollection with: self.
	pushing := Set new.
	[queue notEmpty] whileTrue: [ | current |
		current := queue removeFirst.
		(pushing includes: current) ifFalse: [
			queue addAll: (current pushedBy perform: aSymbol)].
		pushing add: current].
	^ pushing size
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:28'
}
SPBlock >> pushDirection [
	| diff |
	diff := self pushCountDiff.
	diff abs < self weight ifTrue: [^ 0].
	^ diff sign
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/23/2025 09:31'
}
SPBlock >> pushSpeed [
	^ 1
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:28'
}
SPBlock >> pushVelocity [
	^ self pushDirection * self pushSpeed @ 0
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
