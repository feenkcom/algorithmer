Class {
	#name : #GtAlgorithmerRustExporter,
	#superclass : #GtAlgorithmerBlockVisitor,
	#instVars : [
		'binary',
		'indentation',
		'depth',
		'operators'
	],
	#category : #'GToolkit-Algorithmer-Exporter-Rust'
}

{ #category : #private }
GtAlgorithmerRustExporter >> decreaseDepth [
	depth := (depth - 1) max: 0
]

{ #category : #private }
GtAlgorithmerRustExporter >> increaseDepth [
	depth := depth + 1
]

{ #category : #initialization }
GtAlgorithmerRustExporter >> initialize [
	super initialize.

	binary := #(* / % + - << >> & #'^' | == != < > <= >= && || = += -= *= /= %= &= |= #'^' = <<= >>=) asSet.
	indentation := String space, String space.
	depth := 0.
	
	operators := { 
		#= -> #==.
	} asOrderedDictionary
]

{ #category : #private }
GtAlgorithmerRustExporter >> printDepthIndentationOn: aStream [
	depth timesRepeat: [ aStream nextPutAll: indentation ]
]

{ #category : #visiting }
GtAlgorithmerRustExporter >> visitAssignVariableBlock: anAssignVariableBlock [
	^ anAssignVariableBlock name, ' = { ', (anAssignVariableBlock valueBlock accept: self), ' }'
]

{ #category : #visiting }
GtAlgorithmerRustExporter >> visitDefineVariableBlock: aDefineVariableBlock [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: 'let';
			space.
		
		aDefineVariableBlock isMutable
			ifTrue: [ aStream nextPutAll: 'mut'; space ].
			
		aStream
			nextPutAll: aDefineVariableBlock name.
			
		aDefineVariableBlock type
			ifNotNil: [
				aStream 
					nextPut: $:;
					space;
					nextPutAll: aDefineVariableBlock type asString  ] ]
]

{ #category : #visiting }
GtAlgorithmerRustExporter >> visitIfBlock: anIfBlock [	
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: 'if';
			space;
			nextPutAll: (anIfBlock conditionBlock accept: self);
			space;
			nextPut: ${;
			cr.

		self increaseDepth.
		self printDepthIndentationOn: aStream.
		aStream nextPutAll: (anIfBlock trueBlock accept: self).
		self decreaseDepth.
		
		aStream cr.
		self printDepthIndentationOn: aStream.
		aStream nextPutAll: '}'.
		
		anIfBlock falseBlock
			ifNotNil: [ :aFalseBlock |
				aStream nextPutAll: ' else {'; cr.
				self increaseDepth.
				self printDepthIndentationOn: aStream.
				aStream nextPutAll: (aFalseBlock accept: self).
				self decreaseDepth.
				aStream cr.
				self printDepthIndentationOn: aStream.
				aStream nextPutAll: '}' ] ]
]

{ #category : #visiting }
GtAlgorithmerRustExporter >> visitMessageSendBlock: aMessageSendBlock [
	^ String streamContents: [ :aStream |
		aStream nextPutAll: aMessageSendBlock receiverName.
		(binary includes: aMessageSendBlock selector)
			ifTrue: [
				aStream
					space;
					nextPutAll: aMessageSendBlock selector;
					space;
					nextPutAll: aMessageSendBlock argumentNames first ]
			ifFalse: [
				aStream
					nextPut: $.;
					nextPutAll: aMessageSendBlock selector;
					nextPut: $(.
				aMessageSendBlock argumentNames
					do: [ :eachArgumentName | aStream nextPutAll: eachArgumentName ]
					separatedBy: [ aStream nextPut: $,; space ].
				aStream nextPut: $) ] ]
]

{ #category : #visiting }
GtAlgorithmerRustExporter >> visitOperatorBlock: anOperatorBlock [
	^ String streamContents: [ :aStream |
		aStream nextPutAll: (anOperatorBlock leftOperand accept: self).
		aStream space.
		
		operators
			at: anOperatorBlock operator
			ifPresent: [ :aRustOperator | aStream nextPutAll: aRustOperator ]
			ifAbsent: [ aStream nextPutAll: anOperatorBlock operator ].
		
		aStream space.
		aStream nextPutAll: (anOperatorBlock rightOperand accept: self) ].
]

{ #category : #visiting }
GtAlgorithmerRustExporter >> visitPrintlnBlock: aPrintlnBlock [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: 'println!("{}", ';
			nextPutAll: (aPrintlnBlock valueBlock accept: self);
			nextPutAll: ')' ]
]

{ #category : #visiting }
GtAlgorithmerRustExporter >> visitPushHeapBlock: aPushHeapBlock [
	^ String streamContents: [ :aStream |
		aPushHeapBlock object isString
			ifTrue: [
				aStream
					nextPut: $";
					nextPutAll: aPushHeapBlock object;
					nextPut: $" ]
			ifFalse: [ aStream print: aPushHeapBlock object ] ]
]

{ #category : #visiting }
GtAlgorithmerRustExporter >> visitSequenceBlock: aSequenceBlock [
	^ String streamContents: [ :aStream |
		aSequenceBlock blocks do: [ :each |
			each == aSequenceBlock blocks first
				ifFalse: [ self printDepthIndentationOn: aStream ].
			aStream
				nextPutAll: (each accept: self)
		] separatedBy: [ aStream nextPut: $;; cr ] ]
]

{ #category : #visiting }
GtAlgorithmerRustExporter >> visitVariableBlock: aVariableBlock [
	^ aVariableBlock name
]

{ #category : #visiting }
GtAlgorithmerRustExporter >> visitWhileBlock: aWhileBlock [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: 'while';
			space;
			nextPut: $(.
			
		aStream nextPutAll: (aWhileBlock condition accept: self).
		
		aStream
			nextPut: $);
			space;
			nextPut: ${;
			cr.
			
		self increaseDepth.
		self printDepthIndentationOn: aStream.
		aStream nextPutAll: (aWhileBlock loop accept: self).
		self decreaseDepth.
		
		aStream cr.
		self printDepthIndentationOn: aStream.
		aStream nextPut: $} ]
]
