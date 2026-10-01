# Purpose: To Containerize the SWE 645 Web Application using Nginx.
# Team Members: Joshitha Keetha & Bhuvitha Tummala
# Course : SWE 645

FROM nginx:alpine

# Copying all application web files into Nginx public directory
COPY . /usr/share/nginx/html/

# Exposing HTTP Port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]