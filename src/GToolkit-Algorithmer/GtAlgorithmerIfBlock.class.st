Class {
	#name : #GtAlgorithmerIfBlock,
	#superclass : #GtAlgorithmerBlock,
	#instVars : [
		'conditionBlock',
		'trueBlock',
		'falseBlock',
		'shouldRunCondition',
		'shouldRunTrue',
		'shouldRunFalse'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerIfBlock >> accept: aVisitor [
	^ aVisitor visitIfBlock: self
]

{ #category : #'api - algorithmer' }
GtAlgorithmerIfBlock >> backOn: anAlgorithmer after: aChildBlock [
	"finished running condition, if the top value on the heap is true next we run the loop"
	
	shouldRunCondition := false.
	shouldRunFalse := false.
	shouldRunTrue := false.
	
	self conditionBlock == aChildBlock
		ifTrue: [
			| aTopHeap |
			
			aTopHeap := anAlgorithmer popHeap.
			shouldRunTrue := aTopHeap == true.
			shouldRunFalse := aTopHeap == false ].
]

{ #category : #accessing }
GtAlgorithmerIfBlock >> conditionBlock [
	^ conditionBlock
]

{ #category : #accessing }
GtAlgorithmerIfBlock >> falseBlock [
	"May return nil if there is no false block"

	^ falseBlock
]

{ #category : #initialization }
GtAlgorithmerIfBlock >> if: aConditionBlock true: aTrueBlock [
	conditionBlock := aConditionBlock.
	trueBlock := aTrueBlock.
	falseBlock := nil
]

{ #category : #initialization }
GtAlgorithmerIfBlock >> if: aConditionBlock true: aTrueBlock false: aFalseBlock [
	conditionBlock := aConditionBlock.
	trueBlock := aTrueBlock.
	falseBlock := aFalseBlock
]

{ #category : #initialization }
GtAlgorithmerIfBlock >> initialize [
	super initialize.
	
	self reset
]

{ #category : #'api - algorithmer' }
GtAlgorithmerIfBlock >> nextBlockOn: anAlgorithmer [
	shouldRunCondition
		ifTrue: [ ^ anAlgorithmer pushBlock: self conditionBlock ].
	shouldRunTrue
		ifTrue: [ ^ anAlgorithmer pushBlock: self trueBlock ].
	(shouldRunFalse and: [ self falseBlock notNil ])
		ifTrue: [ ^ anAlgorithmer pushBlock: self falseBlock ].

	^ nil
]

{ #category : #'api - algorithmer' }
GtAlgorithmerIfBlock >> poppedOn: anAlgorithmer [
	self reset
]

{ #category : #'api - algorithmer' }
GtAlgorithmerIfBlock >> pushedOn: anAlgorithmer [
	self reset
]

{ #category : #initialization }
GtAlgorithmerIfBlock >> reset [
	shouldRunCondition := true.
	shouldRunTrue := false.
	shouldRunFalse := false
]

{ #category : #'api - algorithmer' }
GtAlgorithmerIfBlock >> runBlockOn: anAlgorithmer [
]

{ #category : #accessing }
GtAlgorithmerIfBlock >> trueBlock [
	^ trueBlock
]
