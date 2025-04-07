# HTTP Protocol 

### What is HTTP? 
- Hyper Text Transfer Protocol
- Apps can communicate over the internet via HTTP.
- i.e browser communicating with web server
### What does a request-response style protocol mean?
- user does something on web browser ie url 
- browser creates http request and uses the network to send it to the server
- Server does the processing or whatver then sends HTTP response back to browser.
### What does statelessness mean with HTTP?
- each request is dealt separately, previous requests do not relate.
- no information is stored on the server side unless there are cookies
### What is found in an HTTP request?
- information about the person sending the request
- IP address sending to
- HTTP Method i.e GET, HEAD, POST, PUT, DELETE, PATCH
- HTTP version
- header
- host
- user agent
- what you're willing to accept back
- Status code, 100, is for waiting error, anything with 200 is ok, 300 is redirection, 400 is an client eror, 500 is a server error 
### What is included within a HTTP response?
- HTTP version
- Headers
- server 
- connection keep alive 
- set cookie
- HTTP body
### What are cookies?
- way of identification via session tokens
### What are they (cookies) used for?
- unique identifiers that servers send to browsers
- marketting purposes
- track activity on websites
- to then cater ads to you

### What are the different types of HTTP response status codes?
- Status code, 100, is for waiting error, 
- anything with 200 is ok, 
- 300 is redirection, 
- 400 is an client eror, 
- 500 is a server error 
### What are the HTTP CRUD request methods we can use?
- Create- insert new record from data store
- Read- read existing record ...
- Update- modify ...
- Delete remove ... 
### what is the difference between (POST, ) PUT and PATCH?
- POST - submitting info back to server i.e filling out a form
- PUT - updating information on a database.
### What is DNS?
- Domain Name Service
- DNS translates domain names to IP addresses so browsers can load Internet resources
### What is the difference between HTTP and HTTPS?
- client to server communication is encrypted by the server. APIs 
 
### What is a REST API?
- A mechanism that allows two computer programmes to communcicate with eachother
- REpresentational State Transfer
- RESTful means follows architectural style
### What are the REST API criteria and what do they mean?
- Client-server structure 
- Statelessness
- Cacheability - avoid network traffic
- Layered
- Uniform interface- self descripting message, standard for the api - The defined way a client interacts with the server independent of the device or application
### What is the importance of a layered system?
- clear separation between elements
- client shouldnt know what they're communicating with i.e. directly with REST api or through intermediary.
- shouldn't know how data is stored
- 
### What is a REST endpoint?
- 5 elements e.g |https:|//swapi.dev|/api|/films|/1|
- URL to access API 
- HTTPS
- where it will be hosted
- the api
- collection of films
- film id 1 is what were concerned with
- touchpoint to where all information is gathered
  
### What's the relevance of plurals in the urls of REST APIs?
- useful if you want multiple resources returned from the endpoint
### What does CRUD describe?
- Create- POST if new and doesnt exist or PUT
- Read- GET
- Update- PUT to replace or PATCH to update
- Delete - DELETE only if entity exists in database

### What is an API key?
- Authentication to access an api
### What is HATEOAS - Hypertext As The Engine Of Application State
- architectural constraint in REST which gives us links in the returned JSON document, allowing further data to be retrieved by following the links
- data returned from api request should have links to relating to the resource e.g if the resources from the api was a book, there would be links to the author or other books.

[REST_api_picture](Pictures/REST%20API.png)