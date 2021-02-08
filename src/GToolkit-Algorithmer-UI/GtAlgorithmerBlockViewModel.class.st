Class {
	#name : #GtAlgorithmerBlockViewModel,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'block',
		'isTopBlock'
	],
	#category : #'GToolkit-Algorithmer-UI-View Models'
}

{ #category : #'api - block' }
GtAlgorithmerBlockViewModel >> algorithmerBlockElementClass [
	^ GtAlgorithmerSimpleBlockElement
]

{ #category : #accessing }
GtAlgorithmerBlockViewModel >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #'api - block' }
GtAlgorithmerBlockViewModel >> asAlgorithmerBlockElement [
	^ self algorithmerBlockElementClass new
		algorithmerBlockViewModel: self;
		yourself
]

{ #category : #accessing }
GtAlgorithmerBlockViewModel >> block [
	^ block
]

{ #category : #accessing }
GtAlgorithmerBlockViewModel >> block: anObject [
	block := anObject
]

{ #category : #'api - block' }
GtAlgorithmerBlockViewModel >> blockName [
	^ self block blockName
]

{ #category : #initialization }
GtAlgorithmerBlockViewModel >> initialize [
	super initialize.
	
	isTopBlock := false
]

{ #category : #'api - block' }
GtAlgorithmerBlockViewModel >> isTopBlock [
	^ isTopBlock
]

{ #category : #'api - block' }
GtAlgorithmerBlockViewModel >> isTopBlock: aBoolean [
	isTopBlock = aBoolean
		ifTrue: [ ^ self ].
		
	isTopBlock := aBoolean.
	announcer ifNotNil: [ announcer announce: GtAlgorithmerBlockViewModelTopBlockChanged new ]
]

{ #category : #accessing }
GtAlgorithmerBlockViewModel >> subblockViewModels [
	^ { }
]

{ #category : #enumerating }
GtAlgorithmerBlockViewModel >> withAllSubblockViewModelsDo: aBlockClosure [
	aBlockClosure value: self.
	self subblockViewModels do: [ :eachSubblock | eachSubblock withAllSubblockViewModelsDo: aBlockClosure ]
]
