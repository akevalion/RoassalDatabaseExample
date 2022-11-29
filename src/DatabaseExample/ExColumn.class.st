Class {
	#name : #ExColumn,
	#superclass : #ExElement,
	#instVars : [
		'children'
	],
	#category : #DatabaseExample
}

{ #category : #adding }
ExColumn >> addAll: aCollection [
	children addAll: aCollection
]

{ #category : #converting }
ExColumn >> asShape [
	| shapes shape label |
	shapes := children collect: [ :child | child asShape ] as: RSGroup.
	self normalizeWidth: shapes.
	RSVerticalLineLayout on: shapes.
	shape := shapes asShape
		model: self;
		border: self border;
		color: Color veryVeryLightGray;
		padding: 3;
		draggable;
		yourself.
	label := self label.
	shape add: label.
	label position: 0@ (shape height / -2 - label height).
	^ shape.
]

{ #category : #initialization }
ExColumn >> initialize [
	super initialize.
	children := OrderedCollection new
]

{ #category : #converting }
ExColumn >> normalizeWidth: shapes [
	| maxWidth |
	maxWidth := shapes inject: 0 into: [ :max :each | max max: each width ].
	shapes do: [ :each | each width: maxWidth ].
]
