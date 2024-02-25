from fastapi import FastAPI
from fastapi.responses import HTMLResponse

app = FastAPI()

@app.get("/")
async def index():
    html_content = "<html><body><h1>Hello, World!</h1></body></html>"
    return HTMLResponse(content=html_content, status_code=200)

@app.get("/greet/{name}")
async def greet(name: str):
    message = f"Hello, {name}!"
    html_content = f"<html><body><h1>{message}</h1></body></html>"
    return HTMLResponse(content=html_content, status_code=200)