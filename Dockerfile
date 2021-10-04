FROM docker2021repos/nginx:latest
 
COPY default.conf /etc/nginx/conf.d/default.conf
 
CMD ["nginx", "-g", "daemon off;"]
