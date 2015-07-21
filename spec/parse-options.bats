#!/usr/bin/env bats

@test 'it can parse short options without arguments' {
	run parse-options option:o -- -o
	[[ $output = ';option=yes' ]]
}

@test 'it can parse long options without arguments' {
	run parse-options option:o -- --option
	[[ $output = ';option=yes' ]]
}

@test 'it can parse short options with arguments' {
	run parse-options option:o= -- -o 'text for short'
	[[ $output = ';option=text\ for\ short' ]]
}

@test 'it can parse long options with arguments' {
	run parse-options option:o= -- --option 'text for long'
	[[ $output = ';option=text\ for\ long' ]]
}

@test 'it can parse multiple options' {
	run parse-options foo:f baz:b= -- --foo -b1
	[[ $output = ';foo=yes;baz=1' ]]
}
