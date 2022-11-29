Class {
	#name : #DatabaseVisualizationExample,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'objects',
		'links'
	],
	#category : #DatabaseExample
}

{ #category : #examples }
DatabaseVisualizationExample class >> example01 [
	| builder |
	builder := self new.
	builder objects: self someObjects.
	builder links: { 'root'-> 'extent index' }.
	builder asPresenter open.
]

{ #category : #accessing }
DatabaseVisualizationExample class >> first [
	^ (ExColumn on: 'ext4_inode')
		addAll: {
			ExSimpleText on: 'i_block'.
			ExSimpleBox on: 'eh_header'.
			ExBoxWithBody on: 'root'.
			ExSimpleText on: ''.
			 };
		yourself
]

{ #category : #accessing }
DatabaseVisualizationExample class >> second [
	^ (ExColumn on: 'index node')
		addAll: {
			ExSimpleBox on: 'node header'.
			ExBoxWithBody on: 'extent index'.
			ExBasicText on: '...'.
			ExBasicText on: '...'.
			ExBoxWithBody on: 'extent index'.
			 };
		yourself
]

{ #category : #'as yet unclassified' }
DatabaseVisualizationExample class >> someObjects [
	^ {self first. self second}
]

{ #category : #'public - attach point' }
DatabaseVisualizationExample >> attachPoint [
	^ RSStartEndAttachPoint new
		startAttachPoint: (RSCenteredAttachPoint new);
		endAttachPoint: (RSBorderAttachPoint new endOffset: 10);
		yourself
]

{ #category : #'as yet unclassified' }
DatabaseVisualizationExample >> createLineFrom: shapeFrom to: shapeTo [ 
	| arrow |
	arrow := RSShapeFactory arrow.
	arrow size: 10.
	^ RSLine new
		markerEnd: arrow;
		color: Color black;
		attachPoint: self attachPoint; 
		from: shapeFrom;
		to: shapeTo;
		yourself 
	
]

{ #category : #'accessing - defaults' }
DatabaseVisualizationExample >> defaultContainer [
	| c |
	c := RSCanvas new @ RSCanvasController.
	c camera zoomRatio: 0.7.
	^ c
]

{ #category : #accessing }
DatabaseVisualizationExample >> links: aCollection [ 
	links := aCollection
]

{ #category : #accessing }
DatabaseVisualizationExample >> objects: aCollection [
	objects := aCollection
]

{ #category : #hooks }
DatabaseVisualizationExample >> renderIn: aCanvas [
	"render columns"
	aCanvas addAll: (objects collect: [ :each | each  asShape]).
	self renderLinksOn: aCanvas.
	RSHorizontalLineLayout on: aCanvas nodes.
	
]

{ #category : #rendering }
DatabaseVisualizationExample >> renderLinksOn: aRSCanvas [ 
	| allShapes |
	allShapes := aRSCanvas allChildren select: [:each | each model notNil ].
	aRSCanvas addAll: (links collect: [ :assoc | | from to |
		from := self shapeNamed: assoc key in: allShapes.
		to := self shapeNamed: assoc value in: allShapes.
		self createLineFrom: from to: to.
		 ])
]

{ #category : #'as yet unclassified' }
DatabaseVisualizationExample >> shapeNamed: aString in: aCollection [ 
	^ aCollection detect: [ :each | each model name = aString ]
]
