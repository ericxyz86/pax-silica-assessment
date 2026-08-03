# Static site under nginx with an explicit cache policy (see nginx.conf).
# Replaced Coolify's generic static build pack on 3 Aug 2026 so the serving
# configuration lives in this repo instead of in dashboard state.
FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY . /usr/share/nginx/html
RUN rm -f /usr/share/nginx/html/Dockerfile /usr/share/nginx/html/nginx.conf /usr/share/nginx/html/.dockerignore
