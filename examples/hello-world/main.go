package main

import (
	"net/http"
)

func init() {
	http.HandleFunc("/", helloWorld)
}

func helloWorld(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello World!!"))
}
