Extension { #name : #GtAlgorithmerIfBlock }

{ #category : #'*GToolkit-Algorithmer-UI' }
GtAlgorithmerIfBlock >> asAlgorithmerBlockViewModel [
	^ GtAlgorithmerIfBlockViewModel new
		block: self;
		conditionBlock: self conditionBlock;
		trueBlock: self trueBlock;
		in: [ :aViewModel | self falseBlock ifNotNil: [ aViewModel falseBlock: self falseBlock ] ];
		yourself
]
