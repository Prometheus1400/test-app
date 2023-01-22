FROM node:16.13-alpine as BUILDER

WORKDIR /home/node/app

COPY . .

RUN yarn && yarn build

FROM node:16.13-alpine

WORKDIR /home/node/app

COPY --from=BUILDER /home/node/app/node_modules ./node_modules
COPY --from=builder /home/node/app/dist ./dist
COPY --from=builder /home/node/app/package.json .
# COPY --from=builder /home/node/app/public ./public

EXPOSE 3000
CMD ["node", "dist/server.js"]