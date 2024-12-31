Class {
	#name : #SPAssets,
	#superclass : #Object,
	#classVars : [
		'Cache'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #loading,
	#'squeak_changestamp' : 'mad 12/30/2024 23:26'
}
SPAssets class >> assetLoader [
	^ GitAssetLoader for: 'SqueakoPark'
]

{
	#category : #caching,
	#'squeak_changestamp' : 'mad 12/30/2024 23:25'
}
SPAssets class >> cache [
	^ Cache ifNil: [Cache := WeakKeyDictionary new]
]

{
	#category : #caching,
	#'squeak_changestamp' : 'mad 12/30/2024 23:25'
}
SPAssets class >> cached: aBlock [
	^ self cached: aBlock using: thisContext sender
]

{
	#category : #caching,
	#'squeak_changestamp' : 'mad 12/30/2024 23:25'
}
SPAssets class >> cached: aBlock using: aContext [
	^ (self cache at: aContext method ifAbsentPut: [Dictionary new])
		at: aContext arguments asArray ifAbsentPut: aBlock
]

{
	#category : #effects,
	#'squeak_changestamp' : 'mad 12/31/2024 01:11'
}
SPAssets class >> hueRotate: aForm by: aNumber [
	^ self cached: [aForm collectPixels: [:each |
		(aForm depth = 32 and: [(each bitAnd: 16r00FFFFFF) = 0])
			ifTrue: [each]
			ifFalse: [ | color |
				color := Color colorFromPixelValue: each depth: aForm depth.
				color := Color
							h: color hue + aNumber
							s: color saturation
							v: color luminance
							alpha: color alpha.
				color pixelValueForDepth: aForm depth]]]
]

{
	#category : #key,
	#'squeak_changestamp' : 'mad 12/31/2024 01:32'
}
SPAssets class >> key [
	^ self cached: [self loadForm: 'assets/key.png']
]

{
	#category : #loading,
	#'squeak_changestamp' : 'mad 12/31/2024 00:05'
}
SPAssets class >> loadForm: aString [
	^ self cached: [self assetLoader loadForm: aString]
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 12/31/2024 00:05'
}
SPAssets class >> picocat [
	^ self loadForm: 'assets/picocat.png'
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 12/31/2024 00:02'
}
SPAssets class >> picocatBlinkingFacing: aSymbol hue: aNumber [
	^ self picocatFacing: aSymbol at: 11 hue: aNumber
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 12/31/2024 00:02'
}
SPAssets class >> picocatDeadWithHue: aNumber [
	^ self picocatFacing: #right at: 2 hue: aNumber
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 12/31/2024 00:01'
}
SPAssets class >> picocatFacing: aSymbol at: indexNumber hue: angleNumber [
	^ self slicePicocatAt: indexNumber @ (aSymbol caseOf: {[#right] -> [1]. [#left] -> [2]}) hue: angleNumber
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 12/31/2024 00:02'
}
SPAssets class >> picocatJumpingFacing: aSymbol hue: aNumber [
	^ self picocatFacing: aSymbol at: 6 hue: aNumber
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 12/31/2024 00:03'
}
SPAssets class >> picocatPushing: indexNumber facing: aSymbol hue: angleNumber [
	self assert: (indexNumber between: 1 and: 4).
	^ self picocatFacing: aSymbol at: indexNumber + 6 hue: angleNumber
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 12/31/2024 00:03'
}
SPAssets class >> picocatStandingFacing: aSymbol hue: aNumber [
	^ self picocatFacing: aSymbol at: 1 hue: aNumber
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 12/31/2024 00:03'
}
SPAssets class >> picocatWalking: indexNumber facing: aSymbol hue: angleNumber [
	self assert: (indexNumber between: 1 and: 4).
	^ self picocatFacing: aSymbol at: indexNumber + 2 hue: angleNumber
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 12/31/2024 00:01'
}
SPAssets class >> picocatWithHue: aNumber [
	^ self cached: [self hueRotate: self picocat by: aNumber]
]

{
	#category : #slicing,
	#'squeak_changestamp' : 'mad 12/30/2024 23:25'
}
SPAssets class >> slice: aForm tileSize: sizePoint gap: gapPoint at: indexPoint [
	^ aForm contentsOfArea: ((sizePoint + gapPoint) * (indexPoint - 1) extent: sizePoint)
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 12/31/2024 00:02'
}
SPAssets class >> slicePicocatAt: aPoint hue: aNumber [
	^ self cached: [self slice: (self picocatWithHue: aNumber) tileSize: 80 @ 96 gap: 4 @ 4 at: aPoint]
]
