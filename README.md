# Flashquest API

## Endpoints:

  
###  \* indicate endpoints that are token protected 
###  \! indicate endpoints that are in development

### Device
````
 PUT!  /device/me               {:device_id} -> 200: :user, :token
*POST! /device/finished-launching            -> 202:
*POST! /device/became-active                 -> 202:
*POST! /device/resigned                      -> 202:
````

### Current User
````
*GET!  /me                                   -> 200: :user
*POST! /me/facebook/profile                  -> 200: :user
*POST! /me/twitter/profile                   -> 200: :user
*POST! /me/profile                           -> 200: :user
*GET!  /me/:id/feed                          -> 200: [:activity]  (of my friends)
*GET!  /me/:id/activity                      -> 200: [:activity]  (mine)
````

### People
````
*GET   /people                               -> 200: [:person]
*GET   /people/:id                           -> 200: :person
*GET!  /people/:id/feed                      -> 200: [:activity]  (of person's friends)
*GET!  /people/:id/activity                  -> 200: [:activity]  (person's activity)
*GET   /people/:id/branches                  -> 200: [:branch]
*GET!  /people/:id/branches/:branch_id       -> 200: :branch (person's perspective)
*GET!  /people/:id/businesses                -> 200: [:business]
*GET   /people/:id/quests                    -> 200: [:quest]
*GET   /people/:id/photoquests               -> 200: [:quest]  (photo quests only)
*GET   /people/:id/commentquests             -> 200: [:quest]  (comment quests only)
*GET   /people/:id/rewards                   -> 200: [:reward]
````

### Branches
````
*GET   /branches                             -> 200: [:branch]
*GET   /branches/:id                         -> 200: :branch
*GET   /branches/:id/patrons                 -> 200: [:patron]
*GET   /branches/:id/people                  -> 200: [:person]
*GET!  /branches/:id/activity                -> 200: [:activity]
*GET   /branches/:id/quests?type=:type       -> 200: [:quest]
*GET   /branches/:id/photoquests             -> 200: [:quest]
*GET   /branches/:id/commentquests           -> 200: [:quest]
*GET   /branches/:id/rewards                 -> 200: [:reward]
*POST! /branch/:id/start-quest/:id {:review} -> 200: :quest
*POST! /branch/:id/redeem-reward/:id         -> 200: [:reward]
````

### Patrons
````
*GET   /patrons                              -> 200: [:patron]
*GET   /patrons/:id                          -> 200: :patron
*GET!  /patrons/:id/activity                 -> 200: [:activity] (for patron)
*GET   /patrons/:id/quests?type=:type        -> 200: [:quest]
*GET   /patrons/:id/photoquests              -> 200: [:quest]  (photo quests only)
*GET   /patrons/:id/commentquests            -> 200: [:quest]  (comment quests only)
*GET   /patrons/:id/rewards                  -> 200: [:reward]
````

### Quests
````
*GET   /quests                               -> 200: [:quest]
*GET   /quests/:id                           -> 200: :quest
*PUT!  /quests/:id/approval                  -> 200: :quest
*POST! /quests/:id/comment          :comment -> 200: :quest
*DEL!  /quests/id                            -> 204:
*DEL!  /quests/:id/approval                  -> 204:
*DEL!  /quests/:id/comment/:id               -> 204:
````

### Rewards
````
*GET   /rewards                              -> 200: [:reward]
*GET   /rewards/:id                          -> 200: :reward
````

### Businesses
````
*GET   /businesses                           -> 200: [:business]
*GET   /businesses/:id                       -> 200: :business
*GET   /businesses/:id/branches              -> 200: [:branch]
*GET   /businesses/:id/patrons               -> 200: [:patron]
*GET   /businesses/:id/people                -> 200: [:person]
*GET!  /businesses/:id/activity              -> 200: [:activity]
*GET   /businesses/:id/quests?type=:type     -> 200: [:quest]
*GET   /businesses/:id/photoquests           -> 200: [:quest]
*GET   /businesses/:id/commentquests         -> 200: [:quest]
*GET   /businesses/:id/rewards               -> 200: [:reward]
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