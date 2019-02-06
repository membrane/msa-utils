from locust import HttpLocust, TaskSet, task
import random

class UserBehavior(TaskSet):
    def on_start(self):
        """ on_start is called when a Locust start before any task is scheduled """
        #self.login()
       
    @task(100)
    def profile(self):
        self.client.post("/checkouts", 
            json = {
                "customer": "41440721-19db-4a02-8fd8-b6a0f3427d46",
                "items": [
                {
                    "articleId": "cab08236-1924-4f90-975d-9e056ed14c48",
                    "quantity": 3
                },
                {
                    "articleId": "d996413a-21fb-4c12-b4a8-64996876505b",
                    "quantity": 5
                }
                ]
        }
        , headers={'content-type': 'application/json'}
        , name="checkout")

    @task(1)
    def einlagern1(self):
        self.client.patch("http://localhost:8081/stocks/cab08236-1924-4f90-975d-9e056ed14c48", 
        json = { "quantity": 700 }
        , headers={'content-type': 'application/json'}
        , name="stock-1"
        )

    @task(1)
    def einlagern2(self):
        self.client.patch("http://localhost:8081/stocks/d996413a-21fb-4c12-b4a8-64996876505b", 
        json = { "quantity": 570 }
        , headers={'content-type': 'application/json'}
        , name="stock-4"
        )

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 1
    max_wait = 10
