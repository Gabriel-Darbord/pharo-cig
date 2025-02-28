Class {
	#name : 'CigClassMemberTest',
	#superclass : 'CigBaseTest',
	#category : 'CIG-Tests-Base',
	#package : 'CIG-Tests',
	#tag : 'Base'
}

{ #category : 'tests' }
CigClassMemberTest >> testDeletedConstructorCantBeExported [
	| element |

	element := self translatedUnitFinalcut  elementAtPath: { 'finalcut'. 'FAccelEvent'. 'FAccelEvent(const FAccelEvent &)' }.
	self assert: element isDeleted.
	self deny: element canBeExported
]

{ #category : 'tests' }
CigClassMemberTest >> testParameterTypeTemplate [
	| element |

	"this is a template"
	element := self translatedUnitTvision elementAtPath: { 'TSpan<T>'. 'TSpan<T>(T *, int)' }.
	self assert: (element hasAnyParameterTypeTemplateOf: element parent).
	
	element := self translatedUnitTvision elementAtPath: { 'TSpan<T>'. 'TSpan<T>()' }.
	self deny: (element hasAnyParameterTypeTemplateOf: element parent)
]

{ #category : 'tests' }
CigClassMemberTest >> testReturnTypeClassTemplate [
	| element |

	element := self translatedUnitTvision elementAtPath: { 'TSpan<T>'. 'subspan(int)' }.
	self assert: (element isReturnTypeClassTemplateOf: element parent)
]

{ #category : 'tests' }
CigClassMemberTest >> testReturnTypeTemplate [
	| element |

	"this is a template"
	element := self translatedUnitTvision elementAtPath: { 'TSpan<T>'. 'data()' }.
	self assert: (element isReturnTypeTemplateOf: element parent).
	
	"this is not a template, even if part of same template class"
	element := self translatedUnitTvision elementAtPath: { 'TSpan<T>'. 'empty()' }.
	self deny: (element isReturnTypeTemplateOf: element parent)
]
