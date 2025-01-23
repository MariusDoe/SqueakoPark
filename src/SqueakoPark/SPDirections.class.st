Class {
	#name : #SPDirections,
	#superclass : #Object,
	#category : #'SqueakoPark-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 1/23/2025 13:18'
}
SPDirections class >> all [
	^ {#left. #right. #top. #bottom}
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 1/23/2025 13:18'
}
SPDirections class >> dictionaryWithAll: aBlock [
	^ Dictionary newFrom: (self all collect: [:each | each -> aBlock value])
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 1/23/2025 13:23'
}
SPDirections class >> vector: aSymbol [
	^ aSymbol caseOf: {
		[#left] -> [-1 @ 0].
		[#right] -> [1 @ 0].
		[#top] -> [0 @ -1].
		[#bottom] -> [0 @ 1].
	}
]
