# CHAPAKAZI API

Chapakazi is a web based application designed to match homeowners with trustworthy handymen in their area at competitive prices. The Chapakazi API is a tool that offers details about available handymen, including their areas of expertise, customer ratings, and the types of jobs they perform. Users who register with the app can post jobs and access information on local handymen through the API.

</br> 

## Models indentifes and relationship 

A model is a representation of a specific object, for instance in my application I have a customer, handyman, messages, reviews and jobs. 

The relationship shows how the different models in my application are associated and how they are related.

</br>

* ```A customer has many jobs ```
* ``` A handyman has many jobs through job_handymen ```
* ``` A job has many handymen through job_handymen ```
* ``` A job_handymen belongs to a handyman ```
* ``` A job_handymen belongs toa job ```
* ``` A job belongs to a customer ```
* ``` A job belongs to a handyman ```
* ``` A customer has many reviews ```
* ``` A handyman has many reviews ```
* ``` A review belongs to customer ```
* ``` A review belongs to a handyman ```
* ``` A handyman has many messages ```
* ``` A customer has many messages ```
* ``` A message belongs to a customer ```
* ``` A message belongs to a handyman ```
## Image representation of the models and relationships
![Untitled](https://user-images.githubusercontent.com/108492757/224022525-11764b10-488b-42e6-9e45-8b49f8658753.png)


### Authorization Error
This error is rendered when a user tries to make a request to a protected route  yet they have not sign in to use the application
```
{
    "errors": [
        "Please log in!"
    ]
}
```

### When a user logins 

Login POST request 
```
{
    "handyman": {
        "id": 4,
        "username": "Ian Kimondo",
        "location": "Ruiru,Kiambu",
        "image": "https://img.freepik.com/free-photo/carpenter-cutting-plank-by-circular-saw_329181-3731.jpg?w=740&t=st=1672677374~exp=1672677974~hmac=792260726039772412f447b7f9d73b6f04d0160fa9ae7f3fdbdb260b03dcc60621d6e2",
        "description": "Architecto officia est. Eos ut illo. Ex natus ducimus. Minus eos quia. Quia doloremque eos. Non fugiat et. Et architecto similique. Dicta enim ratione. Et et aut. Tenetur possimus odio. Omnis voluptatem dignissimos. Odit nesciunt qui. Accusamus aut amet. Nam .",
        "rating": "$12-$30",
        "speciality": "Capentry",
        "job_handymen": [],
        "jobs": [],
        "messages": [
            {
                "id": 1,
                "handyman_id": 4,
                "customer_id": 5,
                "message": "Vi."
            },
            {
                "id": 7,
                "handyman_id": 4,
                "customer_id": 4,
                "message": "De."
            }
        ]
    },
    "token": "eyJhbG..."
}
```

* Get request for all jobs 
```
[
    {
        "id": 1,
        "title": "Sales",
        "summary": "Pariatur commodi corrupti. Laborum a dolorem. Ut omnis dolor. Nihil enim voluptas. Deleniti omnis ut. Optio velit est. Molestiae est repudiandae. Explicabo nihil veniam. Expedita dolorem recusandae. Ne...",
        "budget": "$48-$800",
        "description": "Pariatur commodi corrupti. Laborum a dolorem. Ut omnis dolor. Nihil enim voluptas. Deleniti omnis ut. Optio velit est. Molestiae est repudiandae. Explicabo nihil veniam. Expedita dolorem recusandae. Necessitatibus aut est. Dicta sunt dolor. Quisquam est nulla. In quis et. Natus maiores voluptates. Molestiae facere dolorem. Quia eaque rerum. Est possimus consequatur. Unde et aut. Illo dolores blanditiis. Perferendis ullam quo. Earum quisquam unde. Voluptates minus est. Voluptatem id mollitia. Excepturi dolor earum. Est qui repellat. Reiciendis molestiae ex. Cumque quae est. Nisi cum illum. Facilis omnis voluptatibus. Est magni quaerat. Ullam dolores accusantium. Harum corrupti similique. Exercitationem qui aut. Error modi porro. Est ducimus quibusdam. Enim non adipisci. Quod repellat nihil. Laboriosam non aut. Non qui ut. Id sed vitae. Non ipsam animi. Explicabo esse incidunt. Quidem sit velit. Labore aut et. Praesentium voluptas sit. Veritatis non quidem. Sint magni amet. Libero volup.",
        "customer": {
            "id": 5,
            "username": "Josiah Hahn III",
            "image": "https://randomuser.me/api/portraits/women/69.jpg",
            "location": "Umoja, Eastlands",
            "admin_id": 1
        },
        "handymen": [],
        "job_handymen": []
    },
    ....  
]
```

* Get  request for a single job
```
{
    "id": 1,
    "title": "Sales",
    "description": "Pariatur commodi corrupti. Laborum a dolorem. Ut omnis dolor. Nihil enim voluptas. Deleniti omnis ut. Optio velit est. Molestiae est repudiandae. Explicabo nihil veniam. Expedita dolorem recusandae. Necessitatibus aut est. Dicta sunt dolor. Quisquam est nulla. In quis et. Natus maiores voluptates. Molestiae facere dolorem. Quia eaque rerum. Est possimus consequatur. Unde et aut. Illo dolores blanditiis. Perferendis ullam quo. Earum quisquam unde. Voluptates minus est. Voluptatem id mollitia. Excepturi dolor earum. Est qui repellat. Reiciendis molestiae ex. Cumque quae est. Nisi cum illum. Facilis omnis voluptatibus. Est magni quaerat. Ullam dolores accusantium. Harum corrupti similique. Exercitationem qui aut. Error modi porro. Est ducimus quibusdam. Enim non adipisci. Quod repellat nihil. Laboriosam non aut. Non qui ut. Id sed vitae. Non ipsam animi. Explicabo esse incidunt. Quidem sit velit. Labore aut et. Praesentium voluptas sit. Veritatis non quidem. Sint magni amet. Libero volup.",
    "budget": "$48-$800",
    "customer": {
        "id": 5,
        "username": "Josiah Hahn III",
        "image": "https://randomuser.me/api/portraits/women/69.jpg",
        "location": "Umoja, Eastlands",
        "admin_id": 1
    }
}
```

* POST request for a job
```
{
    "id": 11,
    "title": "Farming",
    "summary": "General farm workers plant, cultivate and harvest crops, raise livestock and poultry and maintain and repair farm equipment and buildings. General farm workers perform some or all of the following duti...",
    "budget": "$48-$80",
    "description": "General farm workers plant, cultivate and harvest crops, raise livestock and poultry and maintain and repair farm equipment and buildings. General farm workers perform some or all of the following duties: Plant, fertilize, cultivate, spray, irrigate and harvest crops",
    "customer": {
        "id": 2,
        "username": "Randa Bauch",
        "image": "https://randomuser.me/api/portraits/men/2603.jpg",
        "location": "Thika, Nairobi",
        "admin_id": 1
    },
    "handymen": [],
    "job_handymen": []
}
```

### Api Endpoints


I have added responses to my API to provide feedback when requests are made, and I have also included various output options for users to test and experiment with.
