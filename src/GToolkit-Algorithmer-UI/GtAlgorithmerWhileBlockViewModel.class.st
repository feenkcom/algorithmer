Class {
	#name : #GtAlgorithmerWhileBlockViewModel,
	#superclass : #GtAlgorithmerBlockViewModel,
	#instVars : [
		'conditionBlockViewModel',
		'loopBlockViewModel'
	],
	#category : #'GToolkit-Algorithmer-UI-View Models'
}

{ #category : #'api - block' }
GtAlgorithmerWhileBlockViewModel >> algorithmerBlockElementClass [
	^ GtAlgorithmerWhileBlockElement
]

{ #category : #accessing }
GtAlgorithmerWhileBlockViewModel >> conditionBlock: anAlgorithmerBlock [
	conditionBlockViewModel := anAlgorithmerBlock asAlgorithmerBlockViewModel
]

{ #category : #accessing }
GtAlgorithmerWhileBlockViewModel >> conditionBlockViewModel [
	^ conditionBlockViewModel
]

{ #category : #accessing }
GtAlgorithmerWhileBlockViewModel >> loopBlock: anAlgorithmerBlock [
	loopBlockViewModel := anAlgorithmerBlock asAlgorithmerBlockViewModel
]

{ #category : #accessing }
GtAlgorithmerWhileBlockViewModel >> loopBlockViewModel [
	^ loopBlockViewModel
]

{ #category : #accessing }
GtAlgorithmerWhileBlockViewModel >> subblockViewModels [
	^ { self conditionBlockViewModel . self loopBlockViewModel }
]
