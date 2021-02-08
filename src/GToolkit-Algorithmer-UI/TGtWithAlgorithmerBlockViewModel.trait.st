Trait {
	#name : #TGtWithAlgorithmerBlockViewModel,
	#instVars : [
		'algorithmerBlockViewModel'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #'api - algorithmer block view model' }
TGtWithAlgorithmerBlockViewModel >> algorithmerBlockViewModel [
	"Return a not-null AlgorithmerBlock view model assigned to the receiver element"
	self
		assert: [ algorithmerBlockViewModel notNil ]
		description: [ 'AlgorithmerBlock view model should be initialized' ].

	^ algorithmerBlockViewModel
]

{ #category : #'api - algorithmer block view model' }
TGtWithAlgorithmerBlockViewModel >> algorithmerBlockViewModel: aAlgorithmerBlockViewModel [
	"Set a not-null AlgorithmerBlock view model assigned to the receiver element"
	self
		assert: [ aAlgorithmerBlockViewModel notNil ]
		description: [ 'AlgorithmerBlock view model must not be nil' ].

	algorithmerBlockViewModel == aAlgorithmerBlockViewModel 
		ifTrue: [ ^ self ].

	algorithmerBlockViewModel ifNotNil: [ self unsubscribeFromAlgorithmerBlockViewModel ].
	algorithmerBlockViewModel := aAlgorithmerBlockViewModel.

	self onAlgorithmerBlockViewModelChanged.
	self subscribeToAlgorithmerBlockViewModel
]

{ #category : #'api - algorithmer block view model' }
TGtWithAlgorithmerBlockViewModel >> hasAlgorithmerBlockViewModel [
	"Return a true if AlgorithmerBlock view model is assigned to the receiver element, false otherwise"
	<return: #Boolean>

	^ algorithmerBlockViewModel notNil
]

{ #category : #'api - algorithmer block view model' }
TGtWithAlgorithmerBlockViewModel >> onAlgorithmerBlockViewModelChanged [
	"Is sent when a new AlgorithmerBlock view model is assigned to the element"
	
	self explicitRequirement
]

{ #category : #'api - algorithmer block view model' }
TGtWithAlgorithmerBlockViewModel >> subscribeToAlgorithmerBlockViewModel [
	"Is sent after a new AlgorithmerBlock view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromAlgorithmerBlockViewModel if elements subscribe to them"
]

{ #category : #'api - algorithmer block view model' }
TGtWithAlgorithmerBlockViewModel >> unsubscribeFromAlgorithmerBlockViewModel [
	"Is sent before a new AlgorithmerBlock view model is assigned to the element.
	Elements that subscribe to AlgorithmerBlock view model in domain model are required to implement this methods"
]
