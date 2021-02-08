Class {
	#name : #GtAlgorithmerWhileBlockElement,
	#superclass : #BlElement,
	#traits : 'TGtWithAlgorithmerBlockViewModel + TBrLayoutResizable',
	#classTraits : 'TGtWithAlgorithmerBlockViewModel classTrait + TBrLayoutResizable classTrait',
	#instVars : [
		'conditionElement',
		'loopElement'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #initialization }
GtAlgorithmerWhileBlockElement >> createBlocksElement [
	^ BrVerticalPane new
		fitContent;
		clipChildren: false
]

{ #category : #initialization }
GtAlgorithmerWhileBlockElement >> createLabel [
	^ BrLabel new
		look: BrGlamorousLabelLook new;
		beTinySize
]

{ #category : #initialization }
GtAlgorithmerWhileBlockElement >> initialize [
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
	
	loopElement := self createBlocksElement.
	loopElement margin: (BlInsets left: 15 right: -25).

	self addChildren: {
		self createLabel
			margin: (BlInsets top: 0 left: 15 bottom: 0 right: 0);
			text: 'while true:'.
		conditionElement .
		self createLabel
			margin: (BlInsets top: 5 left: 15 bottom: 0 right: 0);
			text: 'do:'.
		loopElement }
]

{ #category : #'api - algorithmer block view model' }
GtAlgorithmerWhileBlockElement >> onAlgorithmerBlockViewModelChanged [
	"Is sent when a new AlgorithmerBlock view model is assigned to the element"
	
	conditionElement removeChildren.
	
	conditionElement addChild: (self algorithmerBlockViewModel conditionBlockViewModel asAlgorithmerBlockElement).
	loopElement addChild: (self algorithmerBlockViewModel loopBlockViewModel asAlgorithmerBlockElement).
	
	self onTopBlockChanged
]

{ #category : #'private - event handling' }
GtAlgorithmerWhileBlockElement >> onTopBlockChanged [
	| aBackground |

	aBackground := self algorithmerBlockViewModel isTopBlock
		ifTrue: [ (Color yellow alpha: 0.2) gtOpaqueColorOnWhite ]
		ifFalse: [ Color white ].
		
	self background: aBackground
]

{ #category : #'api - algorithmer block view model' }
GtAlgorithmerWhileBlockElement >> subscribeToAlgorithmerBlockViewModel [
	"Is sent after a new AlgorithmerBlock view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromAlgorithmerBlockViewModel if elements subscribe to them"
	
	self algorithmerBlockViewModel announcer weak
		when: GtAlgorithmerBlockViewModelTopBlockChanged
		send: #onTopBlockChanged
		to: self
]

{ #category : #'api - algorithmer block view model' }
GtAlgorithmerWhileBlockElement >> unsubscribeFromAlgorithmerBlockViewModel [
	"Is sent before a new AlgorithmerBlock view model is assigned to the element.
	Elements that subscribe to AlgorithmerBlock view model in domain model are required to implement this methods"
	
	self algorithmerBlockViewModel announcer unsubscribe: self
]
