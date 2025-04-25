# select base image

FROM nginx

# label it (optional)
LABEL MAINTAINER=abdullahi24i/@sparta

# copy data from localhost to container
COPY index.html /usr/share/nginx/html/

# allow required port to be open
EXPOSE 80

# execute required command 
CMD ["nginx", "-g", "daemon off;"]

