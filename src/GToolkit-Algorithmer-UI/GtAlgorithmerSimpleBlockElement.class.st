Class {
	#name : #GtAlgorithmerSimpleBlockElement,
	#superclass : #BlElement,
	#traits : 'TGtWithAlgorithmerBlockViewModel + TBrLayoutResizable',
	#classTraits : 'TGtWithAlgorithmerBlockViewModel classTrait + TBrLayoutResizable classTrait',
	#instVars : [
		'label'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #initialization }
GtAlgorithmerSimpleBlockElement >> createLabel [
	^ BrLabel new
		look: (BrGlamorousLabelLook new foreground: Color veryDarkGray);
		beSmallSize
]

{ #category : #initialization }
GtAlgorithmerSimpleBlockElement >> initialize [
	super initialize.
	
	self layout: BlLinearLayout vertical.
	self hExact: 200.
	self vFitContent.
	self geometry: (BlRoundedRectangleGeometry cornerRadius: 4).
	self border: (BlBorder paint: Color lightGray width: 1).
	self padding: (BlInsets top: 4 left: 6 bottom: 4 right: 6).
	
	label := self createLabel.
	self addChild: label
]

{ #category : #'api - algorithmer block view model' }
GtAlgorithmerSimpleBlockElement >> onAlgorithmerBlockViewModelChanged [
	"Is sent when a new AlgorithmerBlock view model is assigned to the element"

	label text: self algorithmerBlockViewModel blockName.
	self onTopBlockChanged
]

{ #category : #'private - event handling' }
GtAlgorithmerSimpleBlockElement >> onTopBlockChanged [
	| aBackground |

	aBackground := self algorithmerBlockViewModel isTopBlock
		ifTrue: [ (Color yellow alpha: 0.2) gtOpaqueColorOnWhite ]
		ifFalse: [ Color white ].
		
	self background: aBackground
]

{ #category : #'api - algorithmer block view model' }
GtAlgorithmerSimpleBlockElement >> subscribeToAlgorithmerBlockViewModel [
	"Is sent after a new AlgorithmerBlock view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromAlgorithmerBlockViewModel if elements subscribe to them"
	
	self algorithmerBlockViewModel announcer weak
		when: GtAlgorithmerBlockViewModelTopBlockChanged
		send: #onTopBlockChanged
		to: self
]

{ #category : #'api - algorithmer block view model' }
GtAlgorithmerSimpleBlockElement >> unsubscribeFromAlgorithmerBlockViewModel [
	"Is sent before a new AlgorithmerBlock view model is assigned to the element.
	Elements that subscribe to AlgorithmerBlock view model in domain model are required to implement this methods"
	
	self algorithmerBlockViewModel announcer unsubscribe: self
]
