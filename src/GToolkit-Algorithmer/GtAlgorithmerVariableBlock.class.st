Class {
	#name : #GtAlgorithmerVariableBlock,
	#superclass : #GtAlgorithmerBytecodeBlock,
	#instVars : [
		'variableKey'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #accessing }
GtAlgorithmerVariableBlock >> block: anAlgorithmerBlock name: aSymbol [
	variableKey := GtAlgorithmerVariableHiddenBlockKey new
		name: aSymbol;
		block: anAlgorithmerBlock
]

{ #category : #accessing }
GtAlgorithmerVariableBlock >> name [
	^ variableKey name
]

{ #category : #accessing }
GtAlgorithmerVariableBlock >> name: aSymbol [
	variableKey := GtAlgorithmerVariableVisibleNamedKey new name: aSymbol
]
