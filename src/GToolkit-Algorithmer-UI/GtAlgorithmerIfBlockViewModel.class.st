Class {
	#name : #GtAlgorithmerIfBlockViewModel,
	#superclass : #GtAlgorithmerBlockViewModel,
	#instVars : [
		'conditionBlockViewModel',
		'trueBlockViewModel',
		'falseBlockViewModel'
	],
	#category : #'GToolkit-Algorithmer-UI-View Models'
}

{ #category : #'api - block' }
GtAlgorithmerIfBlockViewModel >> algorithmerBlockElementClass [
	^ GtAlgorithmerIfBlockElement
]

{ #category : #accessing }
GtAlgorithmerIfBlockViewModel >> conditionBlock: anAlgorithmerBlock [
	conditionBlockViewModel := anAlgorithmerBlock asAlgorithmerBlockViewModel
]

{ #category : #accessing }
GtAlgorithmerIfBlockViewModel >> conditionBlockViewModel [
	^ conditionBlockViewModel
]

{ #category : #accessing }
GtAlgorithmerIfBlockViewModel >> falseBlock: anAlgorithmerBlock [
	falseBlockViewModel := anAlgorithmerBlock asAlgorithmerBlockViewModel
]

{ #category : #accessing }
GtAlgorithmerIfBlockViewModel >> falseBlockViewModel [
	^ falseBlockViewModel
]

{ #category : #accessing }
GtAlgorithmerIfBlockViewModel >> subblockViewModels [
	^ self falseBlockViewModel
		ifNil: [ { self conditionBlockViewModel . self trueBlockViewModel } ]
		ifNotNil: [ :aFalseBlockViewModel | { self conditionBlockViewModel . self trueBlockViewModel . aFalseBlockViewModel } ]
]

{ #category : #accessing }
GtAlgorithmerIfBlockViewModel >> trueBlock: anAlgorithmerBlock [
	trueBlockViewModel := anAlgorithmerBlock asAlgorithmerBlockViewModel
]

{ #category : #accessing }
GtAlgorithmerIfBlockViewModel >> trueBlockViewModel [
	^ trueBlockViewModel
]
