Class {
	#name : #GtAlgorithmerIfBlockElement,
	#superclass : #BlElement,
	#traits : 'TGtWithAlgorithmerBlockViewModel + TBrLayoutResizable',
	#classTraits : 'TGtWithAlgorithmerBlockViewModel classTrait + TBrLayoutResizable classTrait',
	#instVars : [
		'conditionElement',
		'trueElement',
		'falseElement',
		'falseLabel'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #initialization }
GtAlgorithmerIfBlockElement >> createBlocksElement [
	^ BrVerticalPane new
		fitContent;
		clipChildren: false
]

{ #category : #initialization }
GtAlgorithmerIfBlockElement >> createLabel [
	^ BrLabel new
		look: BrGlamorousLabelLook new;
		beTinySize
]

{ #category : #initialization }
GtAlgorithmerIfBlockElement >> initialize [
	super initialize.
	
	self fitContent.
	self layout: BlLinearLayout vertical.
	self geometry: (BlRoundedRectangleGeometry cornerRadius: 4).
	self background: Color white.
	self border: (BlBorder paint: Color lightGray width: 1).
	self padding: (BlInsets top: 5 bottom: 10).
	self clipChildren: false.
	
	conditionElement := self createBlocksElement.
	conditionElement margin: (BlInsets left: 15 right: -25).
	
	trueElement := self createBlocksElement.
	trueElement margin: (BlInsets left: 15 right: -25).
	
	falseElement := self createBlocksElement.
	falseElement margin: (BlInsets left: 15 right: -25).

	self addChildren: {
		self createLabel
			margin: (BlInsets top: 0 left: 15 bottom: 0 right: 0);
			text: 'if'.
		conditionElement .
		self createLabel
			margin: (BlInsets top: 5 left: 15 bottom: 0 right: 0);
			text: 'do'.
		trueElement.
		falseLabel := self createLabel
			margin: (BlInsets top: 5 left: 15 bottom: 0 right: 0);
			text: 'else'.
		falseElement }
]

{ #category : #'api - algorithmer block view model' }
GtAlgorithmerIfBlockElement >> onAlgorithmerBlockViewModelChanged [
	"Is sent when a new AlgorithmerBlock view model is assigned to the element"
	
	conditionElement removeChildren.
	trueElement removeChildren.
	falseElement removeChildren.
	
	conditionElement addChild: (self algorithmerBlockViewModel conditionBlockViewModel asAlgorithmerBlockElement).
	trueElement addChild: (self algorithmerBlockViewModel trueBlockViewModel asAlgorithmerBlockElement).
	
	self algorithmerBlockViewModel falseBlockViewModel
		ifNil: [
			falseLabel visibility: BlVisibility gone.
			falseElement visibility: BlVisibility gone ]
		ifNotNil: [ :aFalseBlockViewModel | 
			falseLabel visibility: BlVisibility visible.
			falseElement visibility: BlVisibility visible.
			falseElement addChild: aFalseBlockViewModel asAlgorithmerBlockElement ].

	self onTopBlockChanged
]

{ #category : #'private - event handling' }
GtAlgorithmerIfBlockElement >> onTopBlockChanged [
	| aBackground |

	aBackground := self algorithmerBlockViewModel isTopBlock
		ifTrue: [ (Color yellow alpha: 0.2) gtOpaqueColorOnWhite ]
		ifFalse: [ Color white ].
		
	self background: aBackground
]

{ #category : #'api - algorithmer block view model' }
GtAlgorithmerIfBlockElement >> subscribeToAlgorithmerBlockViewModel [
	"Is sent after a new AlgorithmerBlock view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromAlgorithmerBlockViewModel if elements subscribe to them"
	
	self algorithmerBlockViewModel announcer weak
		when: GtAlgorithmerBlockViewModelTopBlockChanged
		send: #onTopBlockChanged
		to: self
]

{ #category : #'api - algorithmer block view model' }
GtAlgorithmerIfBlockElement >> unsubscribeFromAlgorithmerBlockViewModel [
	"Is sent before a new AlgorithmerBlock view model is assigned to the element.
	Elements that subscribe to AlgorithmerBlock view model in domain model are required to implement this methods"
	
	self algorithmerBlockViewModel announcer unsubscribe: self
]
