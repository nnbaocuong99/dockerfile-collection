// main_test.go

package main

import "testing"

func TestAddition(t *testing.T) {
	if 1+1 != 2 {
		t.Error("Expected 1+1 to equal 2")
	}
}

func TestSubtraction(t *testing.T) {
	if 5-3 != 2 {
		t.Error("Expected 5-3 to equal 2")
	}
}

func TestMultiplication(t *testing.T) {
	if 2*3 != 6 {
		t.Error("Expected 2*3 to equal 6")
	}
}

func TestDivision(t *testing.T) {
	if 6/2 != 3 {
		t.Error("Expected 6/2 to equal 3")
	}
}

// Run tests using: go test
