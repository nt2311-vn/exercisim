package main

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

/*
type User struct {
	Id     int64    `json:"id,omitempty"`
	Name   string   `json:"name,omitempty"`
	Age    int16    `json:"age,omitempty"`
	Skills []string `json:"skills,omitempty"`
}

var users = []User{
	{Id: 1, Name: "Toan", Age: 28, Skills: []string{"node", "go", "rust"}},
	{Id: 2, Name: "Bup", Age: 17, Skills: []string{"elixir", "python"}},
	{Id: 3, Name: "Thao", Age: 28, Skills: []string{"Bi", "Python", "Excel"}},
}

func findById(id string) User {
	for _, user := range users {
		if strconv.Itoa(int(user.Id)) == id {
			return user
		}
		return nil
	}
}
*/

func main() {
	r := gin.Default()
	// trustedPolicies := []string{"nginx"}

	// Use with router
	// r.SetTrustedProxies(trustedPolicies)
	// Server the route $/ping
	// Home page
	r.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "Hello, Ginner",
		})
	})

	/*
		// Get all users router
		r.GET("/users", func(c *gin.Context) {
			c.JSON(http.StatusOK, users)
		})

		// Get user by id

		r.GET("/users/:id", func(c *gin.Context) {
			id := c.Param("id")
			for _, user := range users {
				if strconv.Itoa(int(user.Id)) == id {
					c.JSON(http.StatusOK, user)
					break
				} else {
					c.JSON(http.StatusNotFound, gin.H{
						"message": fmt.Sprintf("No user with id: %s", id),
					})
					break
				}
			}
		})
	*/
	r.GET("/hello/:name", func(c *gin.Context) {
		name := c.Param("name")

		c.JSON(http.StatusOK, gin.H{
			"message": fmt.Sprint("Hello %s", name),
		})
	})
	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
