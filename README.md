# Flashquest API


### Businesses API Endpoints
````
GET /businesses.json
GET /businesses/:id.json
GET /businesses/:id/patrons.json
GET /businesses/:id/quests.json?type=:quest_type
GET /businesses/:id/photos.json
GET /businesses/:id/reviews.json
GET /businesses/:id/rewards.json
GET /businesses/:id/branches.json
````

### Branches API Endpoints
````
GET /branches/:id.json
GET /branches/:id/patrons.json
GET /branches/:id/quests.json?type=:quest_type
GET /branches/:id/photos.json
GET /branches/:id/reviews.json
GET /branches/:id/rewards.json
````

### Patrons API Endpoints
````
GET /patrons/:id.json
GET /patrons/:id/quests.json?type=:quest_type
GET /patrons/:id/photos.json
GET /patrons/:id/reviews.json
GET /patrons/:id/rewards.json
````

### Quests API Endpoints
````
GET /quests/:id.json
````

### Photos API Endpoints
````
GET /photos/:id.json
````

### Reviews API Endpoints
````
GET /reviews/:id.json
````

### Rewards API Endpoints
````
GET /rewards/:id.json
````

## Start Server:
````
bundle
rails s
open http://localhost:3000/businesses.json
````
## Execute Specs:
````
rake 
````
