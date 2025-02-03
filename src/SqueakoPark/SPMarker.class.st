Class {
	#name : #SPMarker,
	#superclass : #SPSceneMorph,
	#category : #'SqueakoPark-Core'
}

{
	#category : #drawing,
	#'squeak_changestamp' : 'mad 2/3/2025 23:54'
}
SPMarker >> drawOn: aCanvas [
	aCanvas
		line: self topCenter to: self bottomCenter width: 2 color: self color;
		line: self leftCenter to: self rightCenter width: 2 color: self color.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 2/4/2025 00:11'
}
SPMarker >> game: aGame [
	super game: aGame.
	self hide.
]
