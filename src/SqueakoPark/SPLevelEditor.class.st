Class {
	#name : #SPLevelEditor,
	#superclass : #BorderedMorph,
	#instVars : [
		'levelName'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 2/3/2025 01:49'
}
SPLevelEditor >> addButtons [
	| buttons |
	buttons := OrderedCollection new.
	buttons add: 'Load' -> [self requestLevelNameAndDo: #load:].
	buttons add: 'Save' -> [self requestLevelNameAndDo: #save:].
	buttons add: 'Play' -> [self play].
	(SPCollider allSubclasses reject: #isAbstract) do: [:each |
		buttons add: (each name allButFirst: 'SP' size) -> [each new openInHand]].
	buttons := buttons collect: [:each | PluggableButtonMorph new
											label: each key;
											model: each value;
											action: #value;
											hResizing: #spaceFill;
											vResizing: #shrinkWrap;
											yourself].
	buttons := Morph new
					color: Color transparent;
					layoutPolicy: TableLayout new;
					listDirection: #leftToRight;
					cellGap: 5;
					addAllMorphs: buttons;
					yourself.
	self
		addMorph: buttons
		fullFrame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 0) offsets: (0 @ (buttons height + 5) negated corner: 0 @ -5)).
]

{
	#category : #io,
	#'squeak_changestamp' : 'mad 2/3/2025 01:41'
}
SPLevelEditor >> addMorph: aMorph [
	super addMorph: aMorph.
	aMorph allMorphsDo: [:each | each == aMorph ifFalse: [each wantsHaloFromClick: false]].
]

{
	#category : #io,
	#'squeak_changestamp' : 'mad 2/3/2025 01:52'
}
SPLevelEditor >> clear [
	self colliders do: #delete.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 01:53'
}
SPLevelEditor >> colliders [
	^ self submorphs select: [:each | each isKindOf: SPCollider]
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'mad 2/2/2025 23:36'
}
SPLevelEditor >> compile [
	self
		compileLevelMethod;
		compileSceneMethod;
		compileCustomizeMethod.
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'mad 2/2/2025 23:48'
}
SPLevelEditor >> compile: aString [
	self compileTarget class compile: aString.
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'mad 2/2/2025 23:39'
}
SPLevelEditor >> compileCustomizeMethod [
	(self compileTarget respondsTo: self customizeMethodName) ifTrue: [^ self].
	self compile: ('{1} aGame
	"room for customization of the level"' format: {self customizeMethodName}).
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'mad 2/2/2025 23:36'
}
SPLevelEditor >> compileLevelMethod [
	self compile: ('{1}
	| game |
	game := self new.
	self
		{2} game;
		{3} game.
	^ game' format: {self levelMethodName. self sceneMethodName. self customizeMethodName})
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'mad 2/3/2025 01:53'
}
SPLevelEditor >> compileSceneMethod [
	| stream |
	stream := WriteStream on: ''.
	stream
		nextPutAll: self sceneMethodName;
		nextPutAll: ' aGame
	aGame extent: ';
		store: self extent;
		nextPut: $.;
		cr.
	self colliders do: [:each |
		stream
			tab;
			nextPutAll: 'aGame spawn: ';
			store: each;
			nextPut: $.;
			cr].
	self compile: stream contents.
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'mad 2/2/2025 23:38'
}
SPLevelEditor >> compileTarget [
	^ SPGame
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'mad 2/2/2025 23:37'
}
SPLevelEditor >> customizeMethodName [
	^ 'level', self levelName, 'Customize:'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 2/2/2025 23:47'
}
SPLevelEditor >> defaultColor [
	^ Color white
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 2/3/2025 01:51'
}
SPLevelEditor >> initialize [
	super initialize.
	self
		layoutPolicy: ProportionalLayout new;
		extent: 800 @ 600;
		borderWidth: 0;
		addButtons;
		addMorph: (BottomRightGripMorph new target: self; yourself).
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'mad 2/2/2025 23:36'
}
SPLevelEditor >> levelMethodName [
	^ 'level', self levelName
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/2/2025 23:36'
}
SPLevelEditor >> levelName [
	^ levelName
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/2/2025 23:36'
}
SPLevelEditor >> levelName: anObject [
	levelName := anObject
]

{
	#category : #io,
	#'squeak_changestamp' : 'mad 2/3/2025 01:43'
}
SPLevelEditor >> load: aString [
	self
		levelName: aString;
		clear.
	SPGame perform: self sceneMethodName asSymbol with: self.
]

{
	#category : #playing,
	#'squeak_changestamp' : 'mad 2/3/2025 01:54'
}
SPLevelEditor >> play [
	self compile.
	(SPGame perform: self levelMethodName asSymbol) openInHand.
]

{
	#category : #io,
	#'squeak_changestamp' : 'mad 2/3/2025 01:50'
}
SPLevelEditor >> requestLevelNameAndDo: aBlock [
	| response |
	response := UIManager default
					request: 'Level name:'
					initialAnswer: self levelName.
	response ifEmpty: [^ self].
	aBlock value: self value: response.
]

{
	#category : #io,
	#'squeak_changestamp' : 'mad 2/3/2025 01:09'
}
SPLevelEditor >> save: aString [
	self
		levelName: aString;
		compile.
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'mad 2/2/2025 23:37'
}
SPLevelEditor >> sceneMethodName [
	^ 'level', self levelName, 'Scene:'
]

{
	#category : #io,
	#'squeak_changestamp' : 'mad 2/3/2025 01:40'
}
SPLevelEditor >> spawn: aMorph [
	self addMorph: aMorph.
	aMorph position: aMorph position + self position.
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'mad 2/2/2025 23:51'
}
SPLevelEditor >> wantsDroppedMorph: aMorph event: anEvent [
	^ aMorph isKindOf: SPCollider
]
