Class {
	#name : #SPSceneMorph,
	#superclass : #Morph,
	#instVars : [
		'game'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:48'
}
SPSceneMorph class >> isAbstract [
	^ self == SPSceneMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:56'
}
SPSceneMorph >> game [
	^ game
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:56'
}
SPSceneMorph >> game: aGame [
	game := aGame.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:58'
}
SPSceneMorph >> isCollider [
	^ false
]

{
	#category : #naming,
	#'squeak_changestamp' : 'mad 2/3/2025 23:43'
}
SPSceneMorph >> knownName: aString [
	self name: aString.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:44'
}
SPSceneMorph >> relativeBounds [
	^ self bounds translateBy: self owner position negated
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:44'
}
SPSceneMorph >> relativeBounds: aRectangle [
	self owner
		ifNil: [self bounds: aRectangle]
		ifNotNil: [self bounds: (aRectangle translateBy: self owner position)].
]

{
	#category : #printing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:43'
}
SPSceneMorph >> storeOn: aStream [
	aStream
		nextPut: $(;
		nextPutAll: self class name;
		nextPutAll: ' new'.
	self storedProperties do: [:each | | getter setter |
		getter := each asSymbol.
		setter := getter asSimpleSetter.
		self assert: ((self respondsTo: getter) and: [self respondsTo: setter]).
		aStream
			space;
			nextPutAll: setter;
			space;
			store: (self perform: getter);
			nextPut: $;].
	aStream nextPutAll: ' yourself)'.
]

{
	#category : #printing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:43'
}
SPSceneMorph >> storedProperties [
	^ #('relativeBounds'), (self knownName ifNil: [{}] ifNotNil: [#('knownName')])
]
