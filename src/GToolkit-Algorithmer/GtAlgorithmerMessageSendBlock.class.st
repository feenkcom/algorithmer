Class {
	#name : #GtAlgorithmerMessageSendBlock,
	#superclass : #GtAlgorithmerCompositeBlock,
	#instVars : [
		'blocks',
		'receiver',
		'selector',
		'arguments'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerMessageSendBlock >> accept: aVisitor [
	^ aVisitor visitMessageSendBlock: self
]

{ #category : #accessing }
GtAlgorithmerMessageSendBlock >> argumentNames [
	^ arguments
]

{ #category : #'api - block' }
GtAlgorithmerMessageSendBlock >> blockName [
	^ String streamContents: [ :aStream |
		| aNumArgs |

		aStream nextPutAll: receiver.

		aNumArgs := selector numArgs.
		aNumArgs isZero
			ifTrue: [ aStream space; nextPutAll: selector trimmed ]
			ifFalse: [
				(aNumArgs = 1 and: [ selector isBinary ])
					ifTrue: [
						aStream
							space;
							nextPutAll: selector trimmed;
							space;
							nextPutAll: arguments first trimmed ]
					ifFalse: [
						(selector splitOn: ':') withIndexDo: [ :eachPart  :anIndex |
							aStream
								space;
								nextPutAll: eachPart trimmed;
								nextPut: $:;
								space;
								nextPutAll: (arguments at: anIndex) trimmed ] ] ] ]
]

{ #category : #accessing }
GtAlgorithmerMessageSendBlock >> blocks [
	^ blocks
]

{ #category : #initialization }
GtAlgorithmerMessageSendBlock >> initialize [
	super initialize
]

{ #category : #accessing }
GtAlgorithmerMessageSendBlock >> receiver [
	^ receiver
]

{ #category : #initialization }
GtAlgorithmerMessageSendBlock >> receiver: aReceiverName selector: aSelectorName [
	self
		receiver: aReceiverName
		selector: aSelectorName arguments: #()
]

{ #category : #initialization }
GtAlgorithmerMessageSendBlock >> receiver: aReceiverName selector: aSelectorName argument: anArgumentName [
	self
		receiver: aReceiverName
		selector: aSelectorName
		arguments: { anArgumentName }
]

{ #category : #initialization }
GtAlgorithmerMessageSendBlock >> receiver: aReceiverName selector: aSelectorName arguments: theArgumentNames [
	self
		assert: [ theArgumentNames isString not ]
		description: [ 'Must be a collection of variable names' ].

	receiver := aReceiverName asSymbol.
	selector := aSelectorName asSymbol.
	arguments := theArgumentNames.

	blocks := Array streamContents: [ :aStream |
		theArgumentNames do: [ :eachArgumentName |
			aStream nextPut: (GtAlgorithmerReadVariableBlock new name: eachArgumentName) ].
		
		aStream nextPut: (GtAlgorithmerPushHeapBlock new object: selector).
		aStream nextPut: (GtAlgorithmerReadVariableBlock new name: receiver).
		aStream nextPut: GtAlgorithmerPerformBlock new ]
]

{ #category : #accessing }
GtAlgorithmerMessageSendBlock >> receiverName [
	<return: #String>

	^ receiver
]

{ #category : #accessing }
GtAlgorithmerMessageSendBlock >> selector [
	<return: #Symbol>

	^ selector
]
