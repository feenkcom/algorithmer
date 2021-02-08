Class {
	#name : #GtAlgorithmerPharoExporter,
	#superclass : #GtAlgorithmerBlockVisitor,
	#category : #'GToolkit-Algorithmer-Exporter-Pharo'
}

{ #category : #visiting }
GtAlgorithmerPharoExporter >> visitAssignVariableBlock: anAssignVariableBlock [
	^ RBAssignmentNode
		variable: (RBTemporaryNode named: anAssignVariableBlock name)
		value: (anAssignVariableBlock valueBlock accept: self)
]

{ #category : #visiting }
GtAlgorithmerPharoExporter >> visitDefineVariableBlock: aDefineVariableBlock [
	^ RBTemporaryNode named: aDefineVariableBlock name
]

{ #category : #visiting }
GtAlgorithmerPharoExporter >> visitIfBlock: anIfBlock [
	| aSelector theArguments |

	aSelector := anIfBlock falseBlock
		ifNil: [ #ifTrue: ]
		ifNotNil: [ #ifTrue:ifFalse: ].
		
	theArguments := { RBBlockNode body: (RBSequenceNode new statements: { anIfBlock trueBlock accept: self }) }.
	anIfBlock falseBlock
		ifNotNil: [ theArguments := theArguments, { RBBlockNode body: (RBSequenceNode new statements: { anIfBlock falseBlock accept: self }) } ].

	^ RBMessageNode
		receiver: (anIfBlock conditionBlock accept: self)
		selector: aSelector
		arguments: theArguments
]

{ #category : #visiting }
GtAlgorithmerPharoExporter >> visitMessageSendBlock: aMessageSendBlock [
	^ RBMessageNode
		receiver: (RBTemporaryNode named: aMessageSendBlock receiverName)
		selector: aMessageSendBlock selector
		arguments: (aMessageSendBlock argumentNames collect: [ :eachArgumentName |
			RBTemporaryNode named: eachArgumentName ])
]

{ #category : #visiting }
GtAlgorithmerPharoExporter >> visitOperatorBlock: anOperatorBlock [
	^ RBMessageNode
		receiver: (anOperatorBlock leftOperand accept: self)
		selector: anOperatorBlock operator
		arguments: { anOperatorBlock rightOperand accept: self }
]

{ #category : #visiting }
GtAlgorithmerPharoExporter >> visitPrintlnBlock: aPrintlnBlock [
	^ RBMessageNode
		receiver: (aPrintlnBlock valueBlock accept: self)
		selector: #traceCr
		arguments: {}
]

{ #category : #visiting }
GtAlgorithmerPharoExporter >> visitPushHeapBlock: aPushHeapBlock [
	^ RBLiteralValueNode value: aPushHeapBlock object
]

{ #category : #visiting }
GtAlgorithmerPharoExporter >> visitSequenceBlock: aSequenceBlock [
	| theVariableDefinitions |
	
	theVariableDefinitions := aSequenceBlock blocks select: [ :eachBlock | eachBlock isVariableDefineBlock ].

	^ RBSequenceNode
		temporaries: (theVariableDefinitions collect: [ :eachBlock | eachBlock accept: self ])
		statements: (aSequenceBlock blocks
			reject: [ :eachBlock | eachBlock isVariableDefineBlock ]
			thenCollect: [ :eachBlock | eachBlock accept: self ])
]

{ #category : #visiting }
GtAlgorithmerPharoExporter >> visitVariableBlock: aVariableBlock [
	^ RBTemporaryNode named: aVariableBlock name
]

{ #category : #visiting }
GtAlgorithmerPharoExporter >> visitWhileBlock: aWhileBlock [
	^ RBMessageNode
		receiver: (RBBlockNode body: (RBSequenceNode new statements: { aWhileBlock condition accept: self }))
		selector: #whileTrue:
		arguments: { 
			(RBBlockNode body: (RBSequenceNode new statements: { aWhileBlock loop accept: self }))
		}
]
