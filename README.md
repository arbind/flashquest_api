# Flashquest API

## Endpoints for /api/v1:


###  \* indicate endpoints that are token protected
###  \! indicate endpoints that are in development

### Device Access Token
````
POST  /devices                :device_id -> 200: :user, :token
  -*POST! /devices/finished-launching        -> 202:
  -*POST! /devices/became-active             -> 202:
  -*POST! /devices/did-resign                -> 202:
````

### Current User
````
*GET    /me                               -> 200: :person
*PATCH! /me    :name, :twitter, :facebook -> 200: :person
*GET!   /me/feed                          -> 200: [:activity]  (of friends)
*GET!   /me/activities                    -> 200: [:activity]  (mine)
````

### People
````
*GET   /people                           -> 200: [:person]
*GET   /people/:id                       -> 200: :person
*GET   /people/:id/branches              -> 200: [:branch]
  -*GET!  /people/:id/branches/:id          -> 200: [:branch]    (perspective)
*GET!  /people/:id/businesses            -> 200: [:business]
  -*GET!  /people/:id/businesses/:id        -> 200: [:business]  (perspective)
*GET   /people/:id/quests                -> 200: [:quest]
*GET   /people/:id/rewards               -> 200: [:reward]
*GET!  /people/:id/activities            -> 200: [:activity]  (person's)
````

### Branches
````
*GET   /branches                         -> 200: [:branch]
*GET   /branches/:id                     -> 200: :branch      (perspective)
*GET   /branches/:id/patrons             -> 200: [:patron]
*GET   /branches/:id/people              -> 200: [:person]
*GET   /branches/:id/quests?type=:type   -> 200: [:quest]
*GET   /branches/:id/rewards             -> 200: [:reward]
*GET!  /branches/:id/activities          -> 200: [:activity]
  +*POST! /branches/:id/quest_descriptions/:id/quests
                                 :review -> 200: :quest
  +*POST! /branches/:id/reward_descriptions/:id/rewards
                                         -> 200: [:reward]
````

### Patrons
````
*GET   /patrons                          -> 200: [:patron]
*GET   /patrons/:id                      -> 200: :patron
*GET   /patrons/:id/quests?type=:type    -> 200: [:quest]
*GET   /patrons/:id/rewards              -> 200: [:reward]
*GET!  /patrons/:id/activities           -> 200: [:activity]  (of patron)
````

### Quests
````
*GET   /quests                           -> 200: [:quest]
*GET   /quests/:id                       -> 200: :quest
  +*DEL   /quests/:id                       -> 204:
  +*POST! /quests/:id/approvals             -> 200: :quest
  +*DEL!  /quests/:id/approvals/:id         -> 204: :quest
*POST  /quests/:id/comments     :comment -> 200: :quest
*DEL   /quests/:id/comments/:id          -> 204: :quest
````

### Rewards
````
*GET   /rewards                          -> 200: [:reward]
*GET   /rewards/:id                      -> 200: :reward
````

### Businesses
````
*GET   /businesses                       -> 200: [:business]
*GET   /businesses/:id                   -> 200: :business    (perspective)
*GET   /businesses/:id/branches          -> 200: [:branch]
*GET   /businesses/:id/patrons           -> 200: [:patron]
*GET   /businesses/:id/people            -> 200: [:person]
*GET   /businesses/:id/quests?type=:type -> 200: [:quest]
*GET   /businesses/:id/rewards           -> 200: [:reward]
  -*GET!  /businesses/:id/activities        -> 200: [:activity]
````

## Start Server:
````
bundle
rails s
open http://localhost:3000/businesses
````
Make sure MongoDB is running.


## Execute Specs:
````
rake
````

## To Contribute:
````
1. fork the project
2. create a feature branch
3. make a pull request
````