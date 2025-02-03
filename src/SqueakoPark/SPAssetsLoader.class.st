Class {
	#name : #SPAssetsLoader,
	#superclass : #Object,
	#category : #'SqueakoPark-Core'
}

{
	#category : #loading,
	#'squeak_changestamp' : 'mad 12/30/2024 23:26'
}
SPAssetsLoader class >> assetLoader [
	^ GitAssetLoader for: 'SqueakoPark'
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 2/2/2025 22:42'
}
SPAssetsLoader class >> button [
	^ self loadForm: 'assets/button.png'
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 2/3/2025 22:22'
}
SPAssetsLoader class >> doorClosed [
	<prefetch: #()>
	^ self loadForm: 'assets/door_closed.png'
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 2/3/2025 22:21'
}
SPAssetsLoader class >> doorOpen [
	<prefetch: #()>
	^ self loadForm: 'assets/door_open.png'
]

{
	#category : #effects,
	#'squeak_changestamp' : 'mad 2/2/2025 22:55'
}
SPAssetsLoader class >> hueRotate: aForm by: aNumber [
	^ aForm collectPixels: [:each |
		(aForm depth = 32 and: [(each bitAnd: 16r00FFFFFF) = 0])
			ifTrue: [each]
			ifFalse: [ | color |
				color := Color colorFromPixelValue: each depth: aForm depth.
				color := Color
							h: color hue + aNumber
							s: color saturation
							v: color luminance
							alpha: color alpha.
				color pixelValueForDepth: aForm depth]]
]

{
	#category : #key,
	#'squeak_changestamp' : 'mad 2/3/2025 00:20'
}
SPAssetsLoader class >> key [
	<prefetch: #()>
	^ self loadForm: 'assets/key.png'
]

{
	#category : #caching,
	#'squeak_changestamp' : 'mad 2/2/2025 22:58'
}
SPAssetsLoader class >> load: aSymbol [
	self assert: aSymbol isUnary.
	^ self cache
		at: (self class lookupSelector: aSymbol)
		ifAbsentPut: [self perform: aSymbol]
]

{
	#category : #loading,
	#'squeak_changestamp' : 'mad 2/2/2025 23:03'
}
SPAssetsLoader class >> loadForm: aString [
	^ self assetLoader loadForm: aString
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 12/31/2024 00:05'
}
SPAssetsLoader class >> picocat [
	^ self loadForm: 'assets/picocat.png'
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 2/3/2025 00:17'
}
SPAssetsLoader class >> picocatBlinkingFacing: aSymbol hue: aNumber [
	<prefetch: #(facing hue)>
	^ self picocatFacing: aSymbol at: 11 hue: aNumber
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 2/3/2025 00:17'
}
SPAssetsLoader class >> picocatDeadWithHue: aNumber [
	<prefetch: #(hue)>
	^ self picocatFacing: #right at: 2 hue: aNumber
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 12/31/2024 00:01'
}
SPAssetsLoader class >> picocatFacing: aSymbol at: indexNumber hue: angleNumber [
	^ self slicePicocatAt: indexNumber @ (aSymbol caseOf: {[#right] -> [1]. [#left] -> [2]}) hue: angleNumber
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 2/3/2025 00:18'
}
SPAssetsLoader class >> picocatJumpingFacing: aSymbol hue: aNumber [
	<prefetch: #(facing hue)>
	^ self picocatFacing: aSymbol at: 6 hue: aNumber
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 2/3/2025 00:19'
}
SPAssetsLoader class >> picocatPushing: indexNumber facing: aSymbol hue: angleNumber [
	<prefetch: #(4 facing hue)>
	self assert: (indexNumber between: 1 and: 4).
	^ self picocatFacing: aSymbol at: indexNumber + 6 hue: angleNumber
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 2/3/2025 00:19'
}
SPAssetsLoader class >> picocatStandingFacing: aSymbol hue: aNumber [
	<prefetch: #(facing hue)>
	^ self picocatFacing: aSymbol at: 1 hue: aNumber
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 2/3/2025 00:19'
}
SPAssetsLoader class >> picocatWalking: indexNumber facing: aSymbol hue: angleNumber [
	<prefetch: #(4 facing hue)>
	self assert: (indexNumber between: 1 and: 4).
	^ self picocatFacing: aSymbol at: indexNumber + 2 hue: angleNumber
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 2/2/2025 23:03'
}
SPAssetsLoader class >> picocatWithHue: aNumber [
	^ self hueRotate: self picocat by: aNumber
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 2/3/2025 00:20'
}
SPAssetsLoader class >> pressedButton [
	<prefetch: #()>
	^ self sliceButtonAt: 2
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 2/3/2025 00:20'
}
SPAssetsLoader class >> releasedButton [
	<prefetch: #()>
	^ self sliceButtonAt: 1
]

{
	#category : #slicing,
	#'squeak_changestamp' : 'mad 12/30/2024 23:25'
}
SPAssetsLoader class >> slice: aForm tileSize: sizePoint gap: gapPoint at: indexPoint [
	^ aForm contentsOfArea: ((sizePoint + gapPoint) * (indexPoint - 1) extent: sizePoint)
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 2/3/2025 01:31'
}
SPAssetsLoader class >> sliceButtonAt: aNumber [
	^ (self slice: self button tileSize: 16 @ 9 gap: 0 @ 0 at: aNumber @ 1) magnifyBy: 3
]

{
	#category : #picocat,
	#'squeak_changestamp' : 'mad 2/2/2025 23:03'
}
SPAssetsLoader class >> slicePicocatAt: aPoint hue: aNumber [
	^ self slice: (self picocatWithHue: aNumber) tileSize: 80 @ 96 gap: 4 @ 4 at: aPoint
]
