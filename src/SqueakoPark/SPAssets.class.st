Class {
	#name : #SPAssets,
	#superclass : #Object,
	#classVars : [
		'Cache',
		'CurrentCacheInvariant'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/2/2025 23:10'
}
SPAssets class >> cache [
	^ Cache ifNil: [Cache := WeakKeyDictionary new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 01:29'
}
SPAssets class >> cacheInvariant [
	^ SPAssetsLoader class methodDict
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'mad 2/3/2025 01:35'
}
SPAssets class >> checkCacheUpToDate [
	self cacheInvariant = self currentCacheInvariant ifTrue: [^ self].
	self cache removeAll.
	self currentCacheInvariant: self cacheInvariant copy.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 01:29'
}
SPAssets class >> currentCacheInvariant [
	^ CurrentCacheInvariant
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 01:29'
}
SPAssets class >> currentCacheInvariant: anObject [
	CurrentCacheInvariant := anObject
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'mad 2/3/2025 01:27'
}
SPAssets class >> doesNotUnderstand: aMessage [
	(SPAssetsLoader respondsTo: aMessage selector)
		ifFalse: [^ super doesNotUnderstand: aMessage].
	self checkCacheUpToDate.
	^ (self cache
		at: (SPAssetsLoader class lookupSelector: aMessage selector)
		ifAbsentPut: [Dictionary new])
			at: aMessage arguments asArray
			ifAbsentPut: [aMessage sendTo: SPAssetsLoader]
]

{
	#category : #prefetching,
	#'squeak_changestamp' : 'mad 2/3/2025 00:27'
}
SPAssets class >> generateArguments: anObject [
	anObject isNumber ifTrue: [^ 1 to: anObject].
	anObject = #hue ifTrue: [^ SPPlayer hues].
	anObject = #facing ifTrue: [^ #(left right)].
	self error: 'unknown arguments generator ', anObject.
]

{
	#category : #prefetching,
	#'squeak_changestamp' : 'mad 2/3/2025 00:40'
}
SPAssets class >> prefetch [
	| messageSends |
	messageSends := OrderedCollection streamContents: [:stream |
		(Pragma allNamed: #prefetch: in: SPAssetsLoader class)
			do: [:each | self prefetch: each on: stream]].
	messageSends
		do: #value
		displayingProgress: [:each |
			'Prefetching ', each receiver, ' ', each asMessage].
]

{
	#category : #prefetching,
	#'squeak_changestamp' : 'mad 2/3/2025 00:35'
}
SPAssets class >> prefetch: aMethod arguments: anArray generate: anotherArray on: aStream [
	| rest |
	anotherArray isEmpty ifTrue: [^ self prefetch: aMethod arguments: anArray on: aStream].
	rest := anotherArray allButFirst.
	(self generateArguments: anotherArray first) do: [:each |
		self
			prefetch: aMethod
			arguments: (anArray copyWith: each)
			generate: rest
			on: aStream]
]

{
	#category : #prefetching,
	#'squeak_changestamp' : 'mad 2/3/2025 00:34'
}
SPAssets class >> prefetch: aMethod arguments: anArray on: aStream [
	aStream nextPut: (MessageSend
							receiver: self
							selector: aMethod selector
							arguments: anArray).
]

{
	#category : #prefetching,
	#'squeak_changestamp' : 'mad 2/3/2025 00:34'
}
SPAssets class >> prefetch: aPragma on: aStream [
	self
		prefetch: aPragma method
		arguments: #()
		generate: aPragma arguments first
		on: aStream.
]
