Class {
	#name : #GtAlgorithmerWhileBlock,
	#superclass : #GtAlgorithmerBlock,
	#instVars : [
		'condition',
		'loop',
		'shouldRunCondition',
		'shouldRunLoop'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #initialization }
GtAlgorithmerWhileBlock class >> while: aConditionBlock do: aLoopBlock [
	^ self new while: aConditionBlock do: aLoopBlock
]

{ #category : #visiting }
GtAlgorithmerWhileBlock >> accept: aVisitor [
	^ aVisitor visitWhileBlock: self
]

{ #category : #'api - algorithmer' }
GtAlgorithmerWhileBlock >> backOn: anAlgorithmer after: aChildBlock [
	"finished running condition, if the top value on the heap is true next we run the loop"

	self condition == aChildBlock
		ifTrue: [
			| aTopHeap |
			
			aTopHeap := anAlgorithmer popHeap.
			shouldRunLoop := aTopHeap == true.
			shouldRunCondition := false ].
		
	self loop == aChildBlock
		ifTrue: [
			shouldRunCondition := true.
			shouldRunLoop := false ]
]

{ #category : #'api - block' }
GtAlgorithmerWhileBlock >> blockName [
	^ 'While'
]

{ #category : #accessing }
GtAlgorithmerWhileBlock >> condition [
	^ condition
]

{ #category : #accessing }
GtAlgorithmerWhileBlock >> condition: anObject [
	condition := anObject
]

{ #category : #initialization }
GtAlgorithmerWhileBlock >> initialize [
	super initialize.
	
	self reset
]

{ #category : #accessing }
GtAlgorithmerWhileBlock >> loop [
	^ loop
]

{ #category : #accessing }
GtAlgorithmerWhileBlock >> loop: anObject [
	loop := anObject
]

{ #category : #'api - algorithmer' }
GtAlgorithmerWhileBlock >> nextBlockOn: anAlgorithmer [
	shouldRunCondition
		ifTrue: [ ^ anAlgorithmer pushBlock: self condition ].
	shouldRunLoop
		ifTrue: [ ^ anAlgorithmer pushBlock: self loop ].

	^ nil
]

{ #category : #'api - algorithmer' }
GtAlgorithmerWhileBlock >> poppedOn: anAlgorithmer [
	self reset
]

{ #category : #'api - algorithmer' }
GtAlgorithmerWhileBlock >> pushedOn: anAlgorithmer [
	self reset
]

{ #category : #initialization }
GtAlgorithmerWhileBlock >> reset [
	shouldRunLoop := false.
	shouldRunCondition := true
]

{ #category : #'api - algorithmer' }
GtAlgorithmerWhileBlock >> runBlockOn: anAlgorithmer [
]

{ #category : #initialization }
GtAlgorithmerWhileBlock >> while: aConditionBlock do: aLoopBlock [
	condition := aConditionBlock.
	loop := aLoopBlock
]
