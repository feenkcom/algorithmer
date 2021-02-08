Class {
	#name : #GtAlgorithmerSequenceBlockElement,
	#superclass : #BlElement,
	#traits : 'TGtWithAlgorithmerBlockViewModel + TBrLayoutResizable',
	#classTraits : 'TGtWithAlgorithmerBlockViewModel classTrait + TBrLayoutResizable classTrait',
	#instVars : [
		'blocksElement'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #initialization }
GtAlgorithmerSequenceBlockElement >> createBlocksElement [
	^ BrVerticalPane new
		fitContent;
		cellSpacing: 5;
		clipChildren: false
]

{ #category : #initialization }
GtAlgorithmerSequenceBlockElement >> initialize [
	super initialize.
	
	self fitContent.
	self layout: BlLinearLayout vertical.
	self geometry: (BlRoundedRectangleGeometry cornerRadius: 4).
	self background: Color white.
	self border: (BlBorder paint: Color lightGray width: 1).
	self padding: (BlInsets top: 10 bottom: 10).
	self clipChildren: false.
	
	blocksElement := self createBlocksElement.
	blocksElement margin: (BlInsets left: 15 right: -25).

	self addChild: blocksElement
]

{ #category : #'api - algorithmer block view model' }
GtAlgorithmerSequenceBlockElement >> onAlgorithmerBlockViewModelChanged [
	"Is sent when a new AlgorithmerBlock view model is assigned to the element"
	
	blocksElement addChildren: (self algorithmerBlockViewModel blocks collect: [ :eachBlock |
		| eachElement |
		
		eachElement := eachBlock algorithmerBlockElementClass new.
		eachElement algorithmerBlockViewModel: eachBlock.
		eachElement ]).
	
	self onTopBlockChanged
]

{ #category : #'private - event handling' }
GtAlgorithmerSequenceBlockElement >> onTopBlockChanged [
	| aBackground |

	aBackground := self algorithmerBlockViewModel isTopBlock
		ifTrue: [ (Color yellow alpha: 0.2) gtOpaqueColorOnWhite ]
		ifFalse: [ Color white ].
		
	self background: aBackground
]

{ #category : #'api - algorithmer block view model' }
GtAlgorithmerSequenceBlockElement >> subscribeToAlgorithmerBlockViewModel [
	"Is sent after a new AlgorithmerBlock view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromAlgorithmerBlockViewModel if elements subscribe to them"
	
	self algorithmerBlockViewModel announcer weak
		when: GtAlgorithmerBlockViewModelTopBlockChanged
		send: #onTopBlockChanged
		to: self
]

{ #category : #'api - algorithmer block view model' }
GtAlgorithmerSequenceBlockElement >> unsubscribeFromAlgorithmerBlockViewModel [
	"Is sent before a new AlgorithmerBlock view model is assigned to the element.
	Elements that subscribe to AlgorithmerBlock view model in domain model are required to implement this methods"
	
	self algorithmerBlockViewModel announcer unsubscribe: self
]
