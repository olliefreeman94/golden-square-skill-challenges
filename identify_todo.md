# Identify "To Do" Method Design Recipe

## 1. Describe the Problem

_As a user_
_So that I can keep track of my tasks_
_I want to check if a text includes the string #TODO_

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
# EXAMPLE

# `identify_todo' checks text for the string "#TODO"
contains_todo = identify_todo(text)

text: a string (e.g. "#TODO Walk the dog")
contains_todo: a boolean

# The method doesn't print anything or have any other side-effects
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# EXAMPLE

identify_todo("") throws an error: "Empty string"
identify_todo("#TODO") throws an error: "Missing information about task"
identify_todo("#TODO Walk the dog") => true
identify_todo("Hello world") => false
identify_todo("Mow the lawn #TODO") => true
identify_todo("#todo") => false
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
