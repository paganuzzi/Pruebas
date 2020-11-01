package main

import (
	"io"
	"log"
	"net/http"
	"os"
	"time"
)

func main() {

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		log.Println(r.Header)
		io.WriteString(w, "Version 4.2.3 "+time.Now().String())
	})

	http.HandleFunc("/down", func(w http.ResponseWriter, r *http.Request) {
		time.Sleep(300)
		os.Exit(1)
	})

	log.Println("Server Online en puerto 8000")
	http.ListenAndServe(":8000", nil)
}
