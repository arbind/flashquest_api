# Flashquest API


### Businesses API Endpoints
````
GET /businesses
GET /businesses/:id
GET /businesses/:id/patrons
GET /businesses/:id/quests?type=:quest_type
GET /businesses/:id/photos
GET /businesses/:id/reviews
GET /businesses/:id/rewards
GET /businesses/:id/branches
````

### Branches API Endpoints
````
GET /branches/:id
GET /branches/:id/patrons
GET /branches/:id/quests?type=:quest_type
GET /branches/:id/photos
GET /branches/:id/reviews
GET /branches/:id/rewards
````

### Patrons API Endpoints
````
GET /patrons/:id
GET /patrons/:id/quests?type=:quest_type
GET /patrons/:id/photos
GET /patrons/:id/reviews
GET /patrons/:id/rewards
````

### Quests API Endpoints
````
GET /quests/:id
````

### Photos API Endpoints
````
GET /photos/:id
````

### Reviews API Endpoints
````
GET /reviews/:id
````

### Rewards API Endpoints
````
GET /rewards/:id
````

## Start Server:
````
bundle
rails s
open http://localhost:3000/businesses
````
## Execute Specs:
````
rake 
````
