FROM node:16-alpine as builder

ARG REACT_APP_DEFAULT_API_PATH

WORKDIR /etesync-web

COPY . .
RUN yarn && yarn build

FROM nginx:alpine
COPY --from=builder /etesync-web/build /usr/share/nginx/html

