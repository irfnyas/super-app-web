FROM node:lts-alpine

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

ARG API_KEY
ARG SENTRY_DSN
ARG SENTRY_SAMPLE_RATE
ARG SENTRY_ENABLED
ARG PUBLIC_PATH
ENV PUBLIC_PATH $PUBLIC_PATH
ENV API_KEY $API_KEY
ENV SENTRY_DSN $SENTRY_DSN
ENV SENTRY_SAMPLE_RATE $SENTRY_SAMPLE_RATE
ENV SENTRY_ENABLED $SENTRY_ENABLED
ENV HOST 0.0.0.0
ENV PORT 3000

RUN npm run build

EXPOSE 3000

CMD [ "npm", "start" ]
