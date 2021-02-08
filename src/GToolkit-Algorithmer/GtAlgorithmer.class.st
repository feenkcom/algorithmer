Class {
	#name : #GtAlgorithmer,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'blocksStack',
		'variables',
		'heap',
		'algorithm'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #'api - visitor' }
GtAlgorithmer >> accept: aVisitor [
	^ aVisitor visitAlgorithmer: self
]

{ #category : #accessing }
GtAlgorithmer >> algorithm [
	^ algorithm
]

{ #category : #accessing }
GtAlgorithmer >> algorithm: anAlgorithmerBlock [
	algorithm := anAlgorithmerBlock.
	self pushBlock: anAlgorithmerBlock
]

{ #category : #accessing }
GtAlgorithmer >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
GtAlgorithmer >> blocksStack [
	^ blocksStack
]

{ #category : #'api - variables' }
GtAlgorithmer >> defineVariable: aVariableKey [
	variables top at: aVariableKey put: nil.
	announcer ifNotNil: [ announcer announce: GtAlgorithmerVariablesChanged new ]
]

{ #category : #'api - blocks' }
GtAlgorithmer >> hasBlocks [
	^ blocksStack isNotEmpty
]

{ #category : #accessing }
GtAlgorithmer >> heap [
	^ heap
]

{ #category : #initialization }
GtAlgorithmer >> initialize [
	super initialize.

	algorithm := nil.

	blocksStack := Stack new.
	heap := Stack new.

	variables := Stack new.
	variables push: OrderedDictionary new
]

{ #category : #'api - blocks' }
GtAlgorithmer >> popBlock [
	| aPoppedStep |
	
	aPoppedStep := blocksStack pop.
	aPoppedStep poppedOn: self.
	announcer ifNotNil: [ announcer announce: GtAlgorithmerTopBlockChanged new ].

	^ aPoppedStep
]

{ #category : #'api - runtime' }
GtAlgorithmer >> popHeap [
	| aHeapTop |

	aHeapTop := heap pop.
	announcer ifNotNil: [ announcer announce: GtAlgorithmerHeapChanged new ].

	^ aHeapTop
]

{ #category : #'api - runtime' }
GtAlgorithmer >> popStackNamed: aStackName [
	^ (variables at: aStackName asSymbol) pop
]

{ #category : #'api - variables' }
GtAlgorithmer >> popVariables [
	variables pop.
	announcer ifNotNil: [ announcer announce: GtAlgorithmerVariablesChanged new ]
]

{ #category : #'api - blocks' }
GtAlgorithmer >> pushBlock: anAlgorithmerBlock [
	<return: #GtAlgorithmerBlock>

	blocksStack push: anAlgorithmerBlock.
	anAlgorithmerBlock pushedOn: self.
	announcer ifNotNil: [ announcer announce: GtAlgorithmerTopBlockChanged new ].
	^ anAlgorithmerBlock
]

{ #category : #'api - runtime' }
GtAlgorithmer >> pushHeap: anObject [
	heap push: anObject.
	announcer ifNotNil: [ announcer announce: GtAlgorithmerHeapChanged new ]
]

{ #category : #'api - runtime' }
GtAlgorithmer >> pushStackNamed: aStackName value: anObject [
	(variables at: aStackName asSymbol ifAbsentPut: [ Stack new ])
		push: anObject
]

{ #category : #'api - variables' }
GtAlgorithmer >> pushVariables [
	variables push: OrderedDictionary new.
	announcer ifNotNil: [ announcer announce: GtAlgorithmerVariablesChanged new ]
]

{ #category : #'api - variables' }
GtAlgorithmer >> readVariable: aVariableKey [
	variables do: [ :eachVariableScope |
		eachVariableScope
			at: aVariableKey
			ifPresent: [ :aValue | ^ aValue ] ].

	self error: 'Variable named ', aVariableKey printString, ' is not defined'
]

{ #category : #'api - algorithmer' }
GtAlgorithmer >> stepBlock [
	"Perform the current block and switch to the next one"
	| aPoppedBlock |
	
	self hasBlocks
		ifFalse: [ ^ self ].
	
	self topBlock runBlockOn: self.

	[ self hasBlocks and: [ (self topBlock nextBlockOn: self) isNil ] ]
		whileTrue: [
			aPoppedBlock := self popBlock.
			self hasBlocks
				ifTrue: [ self topBlock backOn: self after: aPoppedBlock ] ]
]

{ #category : #'api - blocks' }
GtAlgorithmer >> topBlock [
	^ blocksStack top
]

{ #category : #'api - runtime' }
GtAlgorithmer >> topHeap [
	^ heap top
]

{ #category : #'api - runtime' }
GtAlgorithmer >> topStackNamed: aStackName [
	(variables at: aStackName asSymbol) top
]

{ #category : #accessing }
GtAlgorithmer >> variables [
	<return: #Dictionary>

	^ variables
]

{ #category : #'api - variables' }
GtAlgorithmer >> writeVariable: aVariableKey value: anObject [
	variables do: [ :eachVariableScope |
		eachVariableScope
			associationAt: aVariableKey
			ifPresent: [ :anAssociation |
				anAssociation value: anObject.
				announcer ifNotNil: [ announcer announce: GtAlgorithmerVariablesChanged new ].
				^ self ] ].

	self error: 'Variable named ', aVariableKey printString, ' is not defined'
]
