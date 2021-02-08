Class {
	#name : #GtAlgorithmerDefineVariableBlock,
	#superclass : #GtAlgorithmerVariableBlock,
	#instVars : [
		'type',
		'mutable'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerDefineVariableBlock >> accept: aVisitor [
	^ aVisitor visitDefineVariableBlock: self
]

{ #category : #'api - block' }
GtAlgorithmerDefineVariableBlock >> blockName [
	^ 'Define variable ', self name
]

{ #category : #'api - accessing' }
GtAlgorithmerDefineVariableBlock >> bool [
	type := #bool
]

{ #category : #initialization }
GtAlgorithmerDefineVariableBlock >> initialize [
	super initialize.
	
	mutable := false.
	type := nil
]

{ #category : #'api - accessing' }
GtAlgorithmerDefineVariableBlock >> int32 [
	type := #int32
]

{ #category : #testing }
GtAlgorithmerDefineVariableBlock >> isMutable [
	^ mutable
]

{ #category : #testing }
GtAlgorithmerDefineVariableBlock >> isVariableDefineBlock [
	^ true
]

{ #category : #'api - accessing' }
GtAlgorithmerDefineVariableBlock >> mutable [
	mutable := true
]

{ #category : #'api - accessing' }
GtAlgorithmerDefineVariableBlock >> readonly [
	mutable := false
]

{ #category : #'api - algorithmer' }
GtAlgorithmerDefineVariableBlock >> runBlockOn: anAlgorithmer [
	anAlgorithmer defineVariable: variableKey
]

{ #category : #'api - accessing' }
GtAlgorithmerDefineVariableBlock >> type [
	^ type
]
