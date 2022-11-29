Class {
	#name : #ExBoxWithBody,
	#superclass : #ExElement,
	#category : #DatabaseExample
}

{ #category : #converting }
ExBoxWithBody >> asShape [
	| shapes label body shape border |
	border := self border.
	label := super asShape
		model: nil;
		border: border;
		yourself.
	body := RSBox new
		fromRectangle: label encompassingRectangle;
		border: border;
		noPaint;
		color: Color white;
		yourself.
	shapes := { label. body }.
	RSVerticalLineLayout new gapSize: 0; on: shapes.
	shape := shapes asShape
		model: self;
		yourself.
	shape when: RSExtentChangedEvent do: [ :evt | 
		label width: evt shape width.
		body width: evt shape width ].
	^ shape
]
