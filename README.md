## Production Site
[http://lingoapp.herokuapp.com/](http://lingoapp.herokuapp.com/)

![http://g.recordit.co/0VYdlrrnOg.gif](http://g.recordit.co/0VYdlrrnOg.gif)

## Synopsis

**This is the MVP of a flashcard app targeted at advanced learners of Mandarin.**

**First Iteration (completed with given two-week project timeframe):** The first iteration focused on setting the building blocks, which included fundamental models such as a deck of cards, a dictionary and score tracking elements.

**Next Iteration:** This next iteration will focus on building out a randomization of deck method, basic functionality that determines words to focus on within a deck based on study patterns, and simple rendering of basic study patterns specific to the user. The "Hello Kitty" image is a placeholder for the visual touch point to be associated with a card.

**Next Next Iteration:** Build a Google Chrome extension that will enable a user-friendly way of creating flashcards that will post to Lingo App.

## Motivation

Lingo App was conceived years as a working professional whose appetite for learning is sometimes larger than what time can allow.

Two additional reasons for its conception:
  1. There was a curiosity about the process and challenges involved in building SuperMemo-like applications (basically anything related to learning management tools and language); and
  2. The high-level problem this app strives to solves is the barrier of effort required to maintain and enhance language skills. Creating flashcards and having a set schedule for learning a language are important elements. However, it's difficult to get back on the wagon if only a little sidetracked!

## First Iteration: Project Requirements

As stated above, Lingo App's MVP was built under the context of a two-week self-directed project. Below are links to the general requirements for a self-directed project and evaluation notes.

* [Project Spec](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/self_directed_project.md)
* [Project Evaluation](https://github.com/lingtran/lingo_app/blob/master/lingo-app-eval.md)

## Tech Stack

##### Server-side
> Ruby on Rails | Ruby | PostgreSQL | WEBrick

##### Client-side
> JavaScript | HTML | CSS

##### Styling
> Semantic UI

## Installation

##### Clone git repo
> `git clone https://github.com/lingtran/lingo_app`

#### Install Gems
> `bundle install`

##### Loading the database and seed file
> For initial setup:
`rake db:setup`

> Alternative setup:
`rake db:create db:migrate db:seed`

#### Run development environment
> `rails s`

> Visit url: `http://localhost:3000`

## Tests

Test Suite: RSpec/Factory Girl/Database Cleaner/vcr/WebMock

##### Run all tests
> `rspec`

## Internal API Reference

Endpoint of internal API created to interact with the Google Charts API:

> `GET '/api/v1/users/scores/:deck_id'` - View scores across users specific to a deck_id

## Consumed API Reference

Google Charts API: [https://developers.google.com/chart/](https://developers.google.com/chart/)

## License

The MIT License (MIT)
Copyright (c) 2016 Ling Tran

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
