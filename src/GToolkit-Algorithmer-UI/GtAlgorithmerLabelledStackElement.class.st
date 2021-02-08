Class {
	#name : #GtAlgorithmerLabelledStackElement,
	#superclass : #BrVerticalPane,
	#instVars : [
		'itemNameBlock',
		'stackList',
		'stackLabel'
	],
	#category : #'GToolkit-Algorithmer-UI-Helpers'
}

{ #category : #'instance creation' }
GtAlgorithmerLabelledStackElement >> createStackLabel [
	^ BrLabel new
		look: (BrGlamorousLabelLook new foreground: Color gray);
		beSmallSize
]

{ #category : #'instance creation' }
GtAlgorithmerLabelledStackElement >> createStackList [
	^ BrSimpleList new
		vFitContentLimited;
		hMatchParent;
		background: Color white;
		padding: (BlInsets top: 10 left: 10 bottom: 10 right: 10);
		itemStencil: [
			BrLabel new
				look: BrGlamorousLabelLook new;
				beSmallSize;
				hMatchParent;
				padding: (BlInsets top: 5 left: 7 bottom: 5 right: 7);
				margin: (BlInsets top: 2 left: 0 bottom: 2 right: 0);
				geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
				border: (BlBorder paint: Color lightGray width: 1);
				background: (Color gray alpha: 0.1) gtOpaqueColorOnWhite ];
		itemDataBinder: [ :itemLabel :itemObject :itemPosition |
			itemPosition = 1
				ifTrue: [  itemLabel border: (BlBorder paint: BrGlamorousColors primaryBorderColor width: 1) ]
				ifFalse: [ itemLabel border: (BlBorder paint: Color lightGray width: 1) ].
			
			itemLabel text: (self itemNameBlock value: itemObject) ]
]

{ #category : #'instance creation' }
GtAlgorithmerLabelledStackElement >> createStackWall [
	^ BlElement new
		background: Color gray;
		constraintsDo: [ :c | c ignoreByLayout ]
]

{ #category : #initialization }
GtAlgorithmerLabelledStackElement >> initialize [
	super initialize.
	
	self matchParent;
		alignBottomCenter.

	itemNameBlock := [ :anItemObject | anItemObject gtDisplayText ].

	stackList := self createStackList.
	stackLabel := self createStackLabel.
	
	stackList addChildren: { 
		self createStackWall
			constraintsDo: [ :c |
				c horizontal exact: 2.
				c vertical matchParent.
				c ignored horizontal alignRight ].
		self createStackWall
			constraintsDo: [ :c |
				c horizontal exact: 2.
				c vertical matchParent.
				c ignored horizontal alignLeft ].
		self createStackWall
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical exact: 2.
				c ignored vertical alignBottom ] }.

	self addChildren: { 
		stackList.
		stackLabel
	}
]

{ #category : #accessing }
GtAlgorithmerLabelledStackElement >> itemNameBlock [
	^ itemNameBlock
]

{ #category : #accessing }
GtAlgorithmerLabelledStackElement >> itemNameBlock: anObject [
	itemNameBlock := anObject
]

{ #category : #accessing }
GtAlgorithmerLabelledStackElement >> items: aCollection [
	stackList items: aCollection
]

{ #category : #accessing }
GtAlgorithmerLabelledStackElement >> label: aStringOrText [
	stackLabel text: aStringOrText
]
