package main

import (
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/joho/godotenv"
)

func main() {
	err := godotenv.Load(".env")

	if err != nil {
		fmt.Printf("could not load env: %v", err)
	}

	Init()

	router := mux.NewRouter()

	router.HandleFunc("/posts", GetPosts).Methods("GET")
	router.HandleFunc("/posts", CreatePost).Methods("POST")
	router.HandleFunc("/posts/{id}", GetPost).Methods("GET")
	router.HandleFunc("/posts/{id}", UpdatePost).Methods("PUT")
	router.HandleFunc("/posts/{id}", DeletePost).Methods("DELETE")

	http.ListenAndServe(":8000", router)
}
