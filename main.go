package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/gorilla/mux"
)

func main() {
	port := os.Getenv("PORT")
	addr := fmt.Sprintf(":%s", port)
	if len(port) == 0 {
		panic(fmt.Errorf("no PORT env var found"))
	}

	fmt.Printf("started on '%s'\n", addr)

	r := mux.NewRouter()
	r.HandleFunc("/", heartbeat)

	err := http.ListenAndServe(addr, r)
	if err != nil {
		panic(err)
	}
}

func heartbeat(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "success")
}
