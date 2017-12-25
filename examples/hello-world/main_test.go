package main

import (
	"io/ioutil"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestHelloWorld(t *testing.T) {
	s := httptest.NewServer(http.HandlerFunc(helloWorld))
	defer s.Close()

	resp, err := http.Get(s.URL)
	if err != nil {
		t.Fatal(err)
	}
	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		t.Fatal(err)
	}

	if want, got := "Hello World!!", string(body); want != got {
		t.Errorf("want %v, got %v", want, got)
	}
}
