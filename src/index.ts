import { Hono } from 'hono'

const app = new Hono()

const password = 'aaa'

app.get('/', (c) => {
  return c.text('Hello Hono!')
})

export default app
