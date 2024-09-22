package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"net/http"
)

type Request struct {
	Prompt string `json:"prompt"`
}

type Response struct {
	Result string `json:"result"`
}

func askDeepseekCoder(prompt string) (string, error) {
	url := "https://chat.deepseek.com/coder"
	request := Request{Prompt: prompt}
	requestBody, err := json.Marshal(request)
	if err != nil {
		return "", err
	}

	resp, err := http.Post(url, "application/json", bytes.NewBuffer(requestBody))
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()

	var response Response
	err = json.NewDecoder(resp.Body).Decode(&response)
	if err != nil {
		return "", err
	}

	return response.Result, nil
}

func main() {
	prompt := "What is the capital of France?"
	response, err := askDeepseekCoder(prompt)
	if err != nil {
		fmt.Printf("Error: %v\n", err)
	} else {
		fmt.Printf("Response: %s\n", response)
	}
}
