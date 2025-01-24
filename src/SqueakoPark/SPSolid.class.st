Class {
	#name : #SPSolid,
	#superclass : #SPCollider,
	#instVars : [
		'pushersTowards'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:15'
}
SPSolid >> allPushersTowards: aSymbol [
	| queue pushers |
	queue := OrderedCollection with: self.
	pushers := Set new.
	[queue notEmpty] whileTrue: [ | current |
		current := queue removeFirst.
		(pushers includes: current) ifFalse: [
			queue addAll: (current pushersTowards at: aSymbol)].
		pushers add: current].
	pushers remove: self.
	^ pushers
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/23/2025 17:40'
}
SPSolid >> canBePushed: aPushRequest [
	^ (self solidsTowards: aPushRequest direction) allSatisfy: [:each |
		each canBePushed: aPushRequest].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 1/23/2025 13:22'
}
SPSolid >> initialize [
	super initialize.
	self pushersTowards: (SPDirections dictionaryWithAll: [Set new]).
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:49'
}
SPSolid >> isSolid [
	^ true
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/24/2025 15:03'
}
SPSolid >> moveTowards: aSymbol [
	aSymbol = #bottom ifFalse: [
		(self pushersTowards at: #bottom) do: [:each | each tryMoveTowards: aSymbol]].
	super moveTowards: aSymbol.
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:43'
}
SPSolid >> pushTowards: aSymbol [
	(self solidsTowards: aSymbol) do: [:each | each pushTowards: aSymbol].
	self moveTowards: aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:05'
}
SPSolid >> pushersTowards [
	^ pushersTowards
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:05'
}
SPSolid >> pushersTowards: aDictionary [
	pushersTowards := aDictionary
]
