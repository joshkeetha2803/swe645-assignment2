# Purpose: Containerize the SWE 645 Web Application using Nginx.
# Team Members: Joshitha Keetha & Bhuvitha Tummala

FROM nginx:alpine

# Copy all application web files into Nginx public directory
COPY . /usr/share/nginx/html/

# Expose HTTP Port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]