package main

import (
	"io/ioutil"
	"net/http"
)

func SayHello(w http.ResponseWriter, req *http.Request) {
	b, _ := ioutil.ReadFile("version.txt")
	w.Write(b)
}

func main() {
	http.HandleFunc("/version", SayHello)
	http.ListenAndServe(":9335", nil)

}
