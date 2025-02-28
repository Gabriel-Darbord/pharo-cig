"
Template for `CigField`, to properly generate its declarations.
"
Class {
	#name : 'CigPharoFieldTemplate',
	#superclass : 'CigPharoTemplate',
	#category : 'CIG-Pharo-Template',
	#package : 'CIG',
	#tag : 'Pharo-Template'
}

{ #category : 'generating' }
CigPharoFieldTemplate >> generateFieldDesc [

	^ String streamContents: [ :stream |
		stream << self element cTemplate generateFFITypeForField << ' ' << self element name ]
]
