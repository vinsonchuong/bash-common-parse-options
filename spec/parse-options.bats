#!/usr/bin/env bats

@test 'it can parse short options without arguments' {
	run parse-options option:o -- -o
	[[ $output = 'option=;option=yes;' ]]
}

@test 'it can parse long options without arguments' {
	run parse-options option:o -- --option
	[[ $output = 'option=;option=yes;' ]]
}

@test 'it can parse short options with arguments' {
	run parse-options option:o= -- -o 'text for short'
	[[ $output = 'option=;option=text\ for\ short;' ]]
}

@test 'it can parse long options with arguments' {
	run parse-options option:o= -- --option 'text for long'
	[[ $output = 'option=;option=text\ for\ long;' ]]
}

@test 'it can parse multiple options' {
	run parse-options foo:f baz:b= -- --foo -b1
	[[ $output = 'foo=;baz=;foo=yes;baz=1;' ]]
}

@test 'it initializes all options variables' {
	run parse-options foo:f bar:b= baz:z= -- -z 1
	[[ $output = 'foo=;bar=;baz=;baz=1;' ]]
}
