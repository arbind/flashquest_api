# Flashquest API


### People API Endpoints
````
GET /people
GET /people/:id
!GET /people/:id/feed     (my friends activity: quests started and reawards redeemed)
!GET /people/:id/activity (my activity: my quests started and my rewards redeemed)
GET /people/:id/branches
!GET /people/:id/branches/:branch_id (return branch profile + patron's points)
!GET /people/:id/businesses
GET /people/:id/quests
GET /people/:id/photoquests
GET /people/:id/commentquests
!GET /people/:id/approvals
!GET /people/:id/comments
GET /people/:id/rewards
````

### Branches API Endpoints
````
GET /branches
GET /branches/:id
GET /branches/:id/patrons
GET /branches/:id/people
!GET /branches/:id/activity (feed of quests started or rewards redeemed at this branch)
GET /branches/:id/quests?type=:quest_type
GET /branches/:id/photoquests
GET /branches/:id/commentquests
!GET /branches/:id/approvals
!GET /branches/:id/comments
GET /branches/:id/rewards
````

### Patrons API Endpoints
````
GET /patrons
GET /patrons/:id
!GET /patrons/:id/activity (feed of quests started or rewards redeemed)
GET /patrons/:id/quests?type=:quest_type
GET /patrons/:id/photoquests
GET /patrons/:id/commentquests
!GET /patrons/:id/approvals
!GET /patrons/:id/comments
GET /patrons/:id/rewards
````

### Quests API Endpoints
````
GET /quests
GET /quests/:id
!GET /quests/:id/approvals
!GET /quests/:id/comments
````

### Rewards API Endpoints
````
GET /rewards
GET /rewards/:id
````

### Businesses API Endpoints
````
GET /businesses
GET /businesses/:id
GET /businesses/:id/branches
GET /businesses/:id/patrons
GET /businesses/:id/people
!GET /businesses/:id/activity
GET /businesses/:id/quests?type=:quest_type
GET /businesses/:id/photoquests
GET /businesses/:id/commentquests
!GET /businesses/:id/approvals
!GET /businesses/:id/comments
GET /businesses/:id/rewards
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
