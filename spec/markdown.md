#Sleep Safe

## What we are Working On

### Will
 I started working on the webhooks between Sinatra and Rails last night and am able to send a post request with the right body to a webhook checker client https://webhook.site/#!/694e7cb6-69c3-4559-8ac5-300577ae7237.
 I am a little bit confused how to implement an endpoint to send to on the rails side. A few questions I have

  1.  Is the endpoint I am sending to going to be in a service?
  2. Does it have its own controller/active record methods?
  3. I don't think I need a GUI but does JSON still render anywhere or are the two post methods between Sinatra and rails all in request body's and nothing needs to be rendered?
  4. Do we need to save anything in the DB from webhooks or can we just send data between the two apps

## What we want to Add

  - Add a feature for shelters to be able to send registered users texts about vacancies
  - Add feature for admin to text registered users about events in the community
  - Add an events calendar styled page with info about job training programs/ clothing drives/ etc.

## Questions

  - We have spent a lot of time setting up 2 factor Authentication via twilio, do we need to implement O'auth still? We feel it is not very representative of our target client and that phone verification is the most important thing.
