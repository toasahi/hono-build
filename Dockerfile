# build
FROM oven/bun:latest AS build

ARG JFROG_USERNAME
ARG SENTRY_TOKEN

WORKDIR /app

COPY package.json bun.lockb ./

RUN bun install --production

RUN echo "${SENTRY_TOKEN}"
RUN echo "${JFROG_USERNAME}"

# runtime
FROM oven/bun:distroless AS runtime

COPY --from=build --chown=nonroot:nonroot /app/node_modules /app/node_modules
COPY src ./src

USER nonroot
EXPOSE 3000

CMD ["run", "--hot", "src/index.ts"]