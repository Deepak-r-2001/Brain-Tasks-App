<<<<<<< HEAD
FROM nginx:stable-alpine
COPY ./dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 3000
=======
# Stage 1: Use nginx to serve static files
FROM nginx:stable-alpine

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy built React app from dist to nginx html folder
COPY dist/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start nginx
>>>>>>> 1fd938c (Added Dockerfile, Kubernetes YAMLs, buildspec, appspec)
CMD ["nginx", "-g", "daemon off;"]
