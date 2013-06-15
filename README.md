# Flashquest API


### Businesses API Endpoints
````
GET /businesses
GET /businesses/:id
GET /businesses/:id/patrons
GET /businesses/:id/quests?type=:quest_type
GET /businesses/:id/photo-quests
GET /businesses/:id/review-quests
GET /businesses/:id/rewards
GET /businesses/:id/branches
````

### Branches API Endpoints
````
GET /branches/:id
GET /branches/:id/patrons
GET /branches/:id/quests?type=:quest_type
GET /branches/:id/photo-quests
GET /branches/:id/review-quests
GET /branches/:id/rewards
````

### Patrons API Endpoints
````
GET /patrons/:id
GET /patrons/:id/quests?type=:quest_type
GET /patrons/:id/photo-quests
GET /patrons/:id/review-quests
GET /patrons/:id/rewards
````

### People API Endpoints
````
GET /people/:id
GET /people/:id/patrons
GET /people/:id/businesses
GET /people/:id/branches
GET /people/:id/quests
GET /people/:id/rewards
````

### Quests API Endpoints
````
GET /quests/:id
````

### Photos API Endpoints
````
GET /photo-quests/:id
````

### Reviews API Endpoints
````
GET /review-quests/:id
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
