Class {
	#name : #GtAlgorithmerViewModel,
	#superclass : #Object,
	#instVars : [
		'algorithmer',
		'algorithmViewModel'
	],
	#category : #'GToolkit-Algorithmer-UI-View Models'
}

{ #category : #accessing }
GtAlgorithmerViewModel >> algorithm [
	^ self algorithmer algorithm
]

{ #category : #accessing }
GtAlgorithmerViewModel >> algorithmViewModel [
	^ algorithmViewModel
]

{ #category : #accessing }
GtAlgorithmerViewModel >> algorithmViewModel: anObject [
	algorithmViewModel := anObject
]

{ #category : #accessing }
GtAlgorithmerViewModel >> algorithmer [
	^ algorithmer
]

{ #category : #accessing }
GtAlgorithmerViewModel >> algorithmer: aGtAlgorithmer [
	algorithmer := aGtAlgorithmer.
	algorithmViewModel := algorithmer algorithm asAlgorithmerBlockViewModel.
	
	self onTopBlockChanged.
	
	algorithmer announcer weak
		when: GtAlgorithmerTopBlockChanged
		send: #onTopBlockChanged
		to: self
]

{ #category : #'api - view model' }
GtAlgorithmerViewModel >> blocksStackItems [
	^ self algorithmer blocksStack asArray
]

{ #category : #'api - view model' }
GtAlgorithmerViewModel >> heapItems [
	^ self algorithmer heap asArray
]

{ #category : #'private - event handling' }
GtAlgorithmerViewModel >> onTopBlockChanged [
	| aTopBlockViewModel |
	
	aTopBlockViewModel := self topBlockViewModel.
	self algorithmViewModel withAllSubblockViewModelsDo: [ :eachBlockViewModel |
		eachBlockViewModel isTopBlock: (eachBlockViewModel == aTopBlockViewModel) ]
]

{ #category : #'api - algorithmer' }
GtAlgorithmerViewModel >> stepBlock [
	self algorithmer stepBlock
]

{ #category : #'api - algorithmer' }
GtAlgorithmerViewModel >> stepOver [
	| aCurrentTopViewModel |
	
	aCurrentTopViewModel := self topBlockViewModel.
	[ self algorithmer hasBlocks and: [ aCurrentTopViewModel == self topBlockViewModel ] ]
		whileTrue: [ self stepBlock ]
]

{ #category : #private }
GtAlgorithmerViewModel >> topBlockViewModel [
	| aMap |

	aMap := IdentityDictionary new.
	self algorithmViewModel withAllSubblockViewModelsDo: [ :eachSubblockViewModel |
		aMap at: eachSubblockViewModel block put: eachSubblockViewModel ].
	
	self algorithmer blocksStack do: [ :eachBlock |
		aMap
			at: eachBlock
			ifPresent: [ :aViewModel | ^ aViewModel ] ].

	^ nil
]

{ #category : #private }
GtAlgorithmerViewModel >> topBlockViewModelFor: anAlgorithmerBlock [
	| aMap |
	
	aMap := IdentityDictionary new.
	self algorithmViewModel withAllSubblockViewModelsDo: [ :eachSubblockViewModel |
		aMap at: eachSubblockViewModel block put: eachSubblockViewModel ].
	
	self algorithmer blocksStack do: [ :eachBlock |
		aMap
			at: eachBlock
			ifPresent: [ :aViewModel | ^ aViewModel ] ].

	^ nil
]

{ #category : #'api - view model' }
GtAlgorithmerViewModel >> variablesAssociations [
	^ self algorithmer variables asArray flatCollect: #associations
]
