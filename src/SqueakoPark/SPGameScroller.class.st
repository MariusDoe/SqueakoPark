Class {
	#name : #SPGameScroller,
	#superclass : #ScrollPane,
	#instVars : [
		'game'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mad 2/4/2025 02:10'
}
SPGameScroller class >> on: aGame [
	^ self new
		game: aGame;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 00:52'
}
SPGameScroller >> game [
	^ game
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 01:40'
}
SPGameScroller >> game: aGame [
	game := aGame.
	aGame when: #scrollIntoView send: #scrollIntoView to: self.
	self scroller addMorph: game.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 2/4/2025 01:50'
}
SPGameScroller >> initialize [
	super initialize.
	self
		extent: 800 px @ 600 px;
		hideScrollBarsIndefinitely.
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'mad 2/4/2025 01:51'
}
SPGameScroller >> scrollIntoView [
	| wanted |
	wanted := self game viewRectangle.
	self scrollToShow: (wanted origin extent: (wanted extent min: self extent)).
]
