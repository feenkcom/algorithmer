Trait {
	#name : #TGtWithAlgorithmerViewModel,
	#instVars : [
		'algorithmerViewModel'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #'api - algorithmer view model' }
TGtWithAlgorithmerViewModel >> algorithmerViewModel [
	"Return a not-null Algorithmer view model assigned to the receiver element"
	self
		assert: [ algorithmerViewModel notNil ]
		description: [ 'Algorithmer view model should be initialized' ].

	^ algorithmerViewModel
]

{ #category : #'api - algorithmer view model' }
TGtWithAlgorithmerViewModel >> algorithmerViewModel: aAlgorithmerViewModel [
	"Set a not-null Algorithmer view model assigned to the receiver element"
	self
		assert: [ aAlgorithmerViewModel notNil ]
		description: [ 'Algorithmer view model must not be nil' ].

	algorithmerViewModel == aAlgorithmerViewModel 
		ifTrue: [ ^ self ].

	algorithmerViewModel ifNotNil: [ self unsubscribeFromAlgorithmerViewModel ].
	algorithmerViewModel := aAlgorithmerViewModel.

	self onAlgorithmerViewModelChanged.
	self subscribeToAlgorithmerViewModel
]

{ #category : #'api - algorithmer view model' }
TGtWithAlgorithmerViewModel >> hasAlgorithmerViewModel [
	"Return a true if Algorithmer view model is assigned to the receiver element, false otherwise"
	<return: #Boolean>

	^ algorithmerViewModel notNil
]

{ #category : #'api - algorithmer view model' }
TGtWithAlgorithmerViewModel >> onAlgorithmerViewModelChanged [
	"Is sent when a new Algorithmer view model is assigned to the element"
	
	self explicitRequirement
]

{ #category : #'api - algorithmer view model' }
TGtWithAlgorithmerViewModel >> subscribeToAlgorithmerViewModel [
	"Is sent after a new Algorithmer view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromAlgorithmerViewModel if elements subscribe to them"
]

{ #category : #'api - algorithmer view model' }
TGtWithAlgorithmerViewModel >> unsubscribeFromAlgorithmerViewModel [
	"Is sent before a new Algorithmer view model is assigned to the element.
	Elements that subscribe to Algorithmer view model in domain model are required to implement this methods"
]
