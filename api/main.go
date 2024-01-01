package main

import (
	"net/http"
	"sample_server/api/usecase"

	"github.com/gorilla/mux"
)

func main() {
	router := mux.NewRouter()

	router.HandleFunc("/posts", usecase.GetPosts).Methods("GET")
	router.HandleFunc("/posts", usecase.CreatePost).Methods("POST")
	router.HandleFunc("/posts/{id}", usecase.GetPost).Methods("GET")
	router.HandleFunc("/posts/{id}", usecase.UpdatePost).Methods("PUT")
	router.HandleFunc("/posts/{id}", usecase.DeletePost).Methods("DELETE")

	http.ListenAndServe(":8000", router)
}
