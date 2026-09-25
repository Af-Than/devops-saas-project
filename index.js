import express from 'express'
const app = express()
const PORT = 3000 || process.env.PORT

app.get('/', (req,res)=>{
    res.json({
        message : "hello from a container",
        service: "hello-node",
        pod:process.env.PODNAME || "pod unknown",
        time: new Date().toISOString()
        
    });
})

app.get('/health',(req,res)=>{
    res.json({
        message : "service is healthy",
        time: new Date().toISOString()
    })
})

app.get('/ready',(req,res)=>{
    res.json({
        message : "service is ready",
        time: new Date().toISOString()
    })
})

app.listen(PORT,()=>{
    console.log(`server running on port ${PORT}`)
})

