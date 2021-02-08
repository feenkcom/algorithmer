Class {
	#name : #GtAlgorithmerExamples,
	#superclass : #Object,
	#category : #'GToolkit-Algorithmer-Examples-Algorithms'
}

{ #category : #examples }
GtAlgorithmerExamples >> fizzbuzz [
	<gtExample>
	^ GtAlgorithmer new
		algorithm: (GtAlgorithmerSequenceBlock new blocks: {
			GtAlgorithmerDefineVariableBlock new mutable int32 name: #n.

			"A counter variable"
			GtAlgorithmerAssignVariableBlock new
				name: #n value: 1.

			GtAlgorithmerWhileBlock
				while: (GtAlgorithmerLessThanBlock new
					leftVariable: #n rightValue: 101
				) do: (GtAlgorithmerSequenceBlock new blocks: {
					GtAlgorithmerIfBlock new
						if: (GtAlgorithmerEqualsBlock new
							left: (GtAlgorithmerModuloBlock new leftVariable: #n rightValue: 15)
							rightValue: 0)
						true: (GtAlgorithmerPrintlnBlock new value: 'fizzbuzz')
						false: (GtAlgorithmerIfBlock new
							if: (GtAlgorithmerEqualsBlock new
								left: (GtAlgorithmerModuloBlock new leftVariable: #n rightValue: 3)
								rightValue: 0)
							true: (GtAlgorithmerPrintlnBlock new value: 'fizz')
							false: (GtAlgorithmerIfBlock new
								if: (GtAlgorithmerEqualsBlock new
									left: (GtAlgorithmerModuloBlock new leftVariable: #n rightValue: 5)
									rightValue: 0)
								true: (GtAlgorithmerPrintlnBlock new value: 'buzz')
								false: (GtAlgorithmerPrintlnBlock new variable: #n))).
					
					GtAlgorithmerAssignVariableBlock new
						name: #n block: (GtAlgorithmerPlusBlock new leftVariable: #n rightValue: 1).
				}).
		}).
]
