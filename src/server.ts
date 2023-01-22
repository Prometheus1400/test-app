import express from "express"

const app = express()

app.get("/", (req, res) => {
    res.send("Hello World!!")
})

const PORT = process.env.PORT ?? 3000

app.listen(PORT, () => {
    if (process.env?.NODE_ENV !== "production") {
        console.log(`server listening at http://localhost:${PORT}`)
    }
})
