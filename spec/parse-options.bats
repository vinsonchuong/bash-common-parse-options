#!/usr/bin/env bats

@test 'it can parse options' {
	run parse-options output:o= -- -o 'text for short'
	[[ $output = ';output=text\ for\ short' ]]

	run parse-options output:o= -- --output 'text for long'
	[[ $output = ';output=text\ for\ long' ]]
}
