# Use Nginx official image
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy our static files to nginx folder
COPY dist /usr/share/nginx/html

# Expose port 3000
EXPOSE 80

# Run nginx on port 3000
CMD ["nginx", "-g", "daemon off;"]
