Class {
	#name : #GtAlgorithmerSequenceBlockViewModel,
	#superclass : #GtAlgorithmerBlockViewModel,
	#instVars : [
		'blocks'
	],
	#category : #'GToolkit-Algorithmer-UI-View Models'
}

{ #category : #'api - block' }
GtAlgorithmerSequenceBlockViewModel >> algorithmerBlockElementClass [
	^ GtAlgorithmerSequenceBlockElement
]

{ #category : #accessing }
GtAlgorithmerSequenceBlockViewModel >> blocks [
	^ blocks
]

{ #category : #accessing }
GtAlgorithmerSequenceBlockViewModel >> blocks: aCollectionOfAlgorithmerBlock [
	blocks := aCollectionOfAlgorithmerBlock collect: #asAlgorithmerBlockViewModel
]

{ #category : #accessing }
GtAlgorithmerSequenceBlockViewModel >> subblockViewModels [
	^ blocks
]
