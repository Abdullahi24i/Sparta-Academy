##### What is a reverse proxy?
- A server that sits between internet and webserver
- intecepts those requests from client and talks to those web servers on behalf of the clients 
#### why is it useful?
- It's used to protect a website as the website ip address is hidden from clients. This means that it can mitigate against Distributes Denial of Service (DDOS) attacks
- It has load balancing capabilities, so it can balance a large amount of incoming requests (network traffic) by distributing them across multiple servers- prevents one server being overloaded.
- It can cache static content for a period of time, which means quick access and thus low latency 
- It can also handle SSL ecrytion, so data can be secure in transit. This means there is no need for the clients to handle SSL 'hand-shake' from all websites, only with a small number of reverse proxies. This can save a lot of money and computational power. 


![reverse-proxy](../Pictures/reverse-proxy.png)




##### How are they different to a forward proxy?
- It sits inbetween client and internet and acts on behalf of client
- forward  proxy sits between clients and the internet. 
- It acts as middle man, intecepting requests and it talks to those web servers on behalf of those client machines
- It proctects clients' online identity as the client IP address is hidden and only the proxy IP is visible 
- It is used to block access to certain content- filtering rules i.e. social networks for schools 
  
  
![Forward-proxy](../Pictures/forward-proxy.jpg)


This is the script to manually create a reverse proxy 

- You first need to install updates onto the virtual server through `sudo apt update -y`
- you then need to update all packages on the server via `sudo apt upgrade -y`
- you then need to install nginx via `sudo apt install nginx -y`
- you will need to change the configuartion of nginx by accessing the 'default' file via command: `sudo nano /etc/nginx/sites-available/default`
- It is in this file where you will go to location, then add the command: `proxy_pass http://[public-IP]:[port];` inside the curly brackets
- save the file
- restart nginx via command: `sudo systemctl restart nginx`
- enable nginx via command: `sudo systemctl enable nginx`
  
  