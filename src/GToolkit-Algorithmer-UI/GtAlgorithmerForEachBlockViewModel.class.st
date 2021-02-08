Class {
	#name : #GtAlgorithmerForEachBlockViewModel,
	#superclass : #GtAlgorithmerBlockViewModel,
	#instVars : [
		'loopBlockViewModel'
	],
	#category : #'GToolkit-Algorithmer-UI-View Models'
}

{ #category : #'api - block' }
GtAlgorithmerForEachBlockViewModel >> algorithmerBlockElementClass [
	^ GtAlgorithmerForEachBlockElement
]

{ #category : #'as yet unclassified' }
GtAlgorithmerForEachBlockViewModel >> blockLabel [
	^ 'for each {1} in {2}' format: { self block eachName . self block collectionName }
]

{ #category : #accessing }
GtAlgorithmerForEachBlockViewModel >> loopBlock: anAlgorithmerBlock [
	loopBlockViewModel := anAlgorithmerBlock asAlgorithmerBlockViewModel
]

{ #category : #accessing }
GtAlgorithmerForEachBlockViewModel >> loopBlockViewModel [
	^ loopBlockViewModel
]

{ #category : #accessing }
GtAlgorithmerForEachBlockViewModel >> subblockViewModels [
	^ { self loopBlockViewModel }
]
