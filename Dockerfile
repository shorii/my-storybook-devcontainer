FROM node:20.10.0-alpine

WORKDIR /app

COPY ./example_app/ /app
 
RUN mkdir src
VOLUME ./src
VOLUME ./.storybook

RUN npm ci && \
    npm install \
        storybook \
        msw \
        msw-storybook-addon \
        @storybook/nextjs \
        @storybook/react \
        @storybook/test \
        @storybook/blocks \
        @storybook/addon-links \
        @storybook/addon-essentials \
        @storybook/addon-onboarding \
        @storybook/addon-interactions \
        -D

RUN apk add jq
RUN mv package.json package_org.json && \
    cat package_org.json | jq '.scripts |= .+ {"storybook": "./node_modules/.bin/storybook dev -p 6006", "build-storybook": "./node_modules/.bin/storybook build"}' > package.json && \
    rm package_org.json
