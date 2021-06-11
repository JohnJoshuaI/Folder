const express = require('express')
const mongoose = require('mongoose')
const cors = require('cors')
const bodyParser = require('body-parser')
const app = express();
app.use(cors())
app.listen(3000, () => {
 console.log("Server started on port 3000")
})

mongoose.connect("mongodb://localhost:27017/Exam", {
  useNewUrlParser: true,
  useUnifiedTopology: true
});
var db = mongoose.connection;
db.on('open', () => {
    console.log('Connected to mongoDB');
});
db.on('error', (error) => {
    console.log(error)
})

//Defining Routes
let todoModel = require('./todo_schema')
const bodyParser = require('body-parser') 
app.use(bodyParser.urlencoded({ extended: false }))
 
app.use(bodyParser.json())

app.post('/todo/add', (req, res) => {
    let newTodo = new todoModel;
    newTodo.title = req.body.todo;
    newTodo.completed = false;
    newTodo.save((err) => {
      if(err){
        res.send("Error while adding Todo");
      }else{
        res.send("Todo added");
      }
  })
})

//Completed
app.get('/todo/completed', (req, res) => {
    todoModel.find({ completed: true }, (err, todos) => {
      if (err) {
        res.send("Error while fetching Todos");
      } else {
        res.json(todos)
      }
    })
  })

//Uncompleted
app.get('/todo/uncompleted', (req, res) => {
    todoModel.find({completed:false},(err, todos) => {
      if(err){
        res.send("Error while fetching Todos");
      }else{
        res.json(todos)
      }
    })
  })

//Updating
app.post('/todo/complete/:id',(req, res) => {
    todoModel.findByIdAndUpdate(req.params.id, {completed: true},         (err, todo) =>{
      if(!err){
        res.send("Good Work");
      }
    })
  })

  //Deleted
  app.delete('/todo/:id', (req, res) => {
    let query = { _id: req.params.id }
    todoModel.deleteOne(query, (err) => {
      if(err){
        res.send("Error while deleting todo")
      }else{
        res.send("Todo deleted")
      }
    })
  })