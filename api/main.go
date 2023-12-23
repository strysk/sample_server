package main

import (
	"encoding/json"
	"log"
	"net/http"
)

type Message struct {
	Text string `json:"text"`
}

func handleRequest(w http.ResponseWriter, r *http.Request) {
	message := Message{Text: "hello"}
	jsonResponse, err := json.Marshal(message)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write(jsonResponse)
}

func main() {
	http.HandleFunc("/api", handleRequest)
	log.Println("Server is ruuning on http://localhost:8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
