Class {
	#name : #BaselineOfGToolkitAlgorithmer,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitAlgorithmer
}

{ #category : #baseline }
BaselineOfGToolkitAlgorithmer >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec 
				package: 'GToolkit-Algorithmer';
				package: 'GToolkit-Algorithmer-Exporter' with: [ spec requires: #(#'GToolkit-Algorithmer') ];
				package: 'GToolkit-Algorithmer-UI' with: [ spec requires: #(#'GToolkit-Algorithmer' #'GToolkit-Algorithmer-Exporter') ];
				package: 'GToolkit-Algorithmer-Examples' with: [ spec requires: #(#'GToolkit-Algorithmer' #'GToolkit-Algorithmer-Exporter' #'GToolkit-Algorithmer-UI') ] ]
]
