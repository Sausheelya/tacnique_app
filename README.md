This is a small, production-ready Quiz Management System built with Ruby on Rails, Active Admin, PostgreSQL, and Bootstrap.
It is a prototype by Tanique, built by Sausheelya.

Features
Admin panel (Active Admin) to:

Create, edit, and delete quizzes

Add questions to a quiz

Support multiple question types: MCQ, True/False, Text

Public quiz pages:

Landing page with project intro and hero image

“Start Quiz” button and list of available quizzes

Quiz-taking page with all questions

Results page showing score and percentage

Scoring logic:

Correctness calculated per question

Supports:

MCQ answers (option text matches correct_answer)

True/False answers (normalized to boolean)

Text answers (case-insensitive, trimmed)

Storage of user responses per question

Clean, responsive UI using Bootstrap

PostgreSQL database (development and production-ready)

Tech Stack
Ruby 3.x

Rails 7.x

PostgreSQL

Active Admin + Devise (admin authentication)

Bootstrap 5 (via CDN)

Ransack (search/filter in admin)



Public landing page: http://localhost:3000

Admin panel: http://localhost:3000/admin

Admin Usage
Log in at /admin with the admin credentials.

Go to “Quizzes”:

Create a new quiz with a title.

Add questions via the nested form.

Question types:

MCQ

question_type: mcq

options: JSON array, e.g. ["Red", "Blue", "Green"]

correct_answer: text of one option, e.g. Red

True/False

question_type: true_false

options: leave blank

correct_answer: true or false

Text

question_type: text

options: leave blank

correct_answer: expected text (comparison is case-insensitive, trimmed)

Public Flow
Visit /:

See a landing page:

“Quiz” title

Message: “This is a prototype by Tanique, built by Sausheelya. Let’s begin the quiz and see how much you know.”

“Start Quiz” button (goes to the first quiz)

Hero logo/image on the right

List of available quizzes below

Click “Start Quiz” or “Take this Quiz”:

Go to /quizzes/:id/take

See:

Quiz title

Logo/image on the right

Questions with proper controls:

MCQ: radio buttons from JSON options

True/False: radio buttons

Text: input field

Submit quiz:

POST to /quizzes/:id/submit

Responses saved to responses table

Score and percentage computed

Redirect to /quizzes/:id/results

Results page:

Shows quiz title, score, and percentage

Logo/image on the side

“Back to quizzes” button to return to /

Key Files
Models:

app/models/quiz.rb

app/models/question.rb

app/models/response.rb

app/models/admin_user.rb

Controllers:

app/controllers/quizzes_controller.rb (public flow)

Views:

app/views/quizzes/index.html.erb (landing)

app/views/quizzes/take.html.erb (take quiz)

app/views/quizzes/results.html.erb (results)

Admin:

app/admin/quizzes.rb

app/admin/questions.rb

Layout:

app/views/layouts/application.html.erb
Contains the simple header with logo and “Quiz System” link.

Customization
Logo:

Header logo: app/assets/images/quiz_logo.png

Hero/large logo: app/assets/images/quiz_hero.jpg

Text:

Landing page intro and call-to-action: edit quizzes/index.html.erb

Prototype attribution text on take/results pages: edit take.html.erb and results.html.erb

Styles:

Global CSS: app/assets/stylesheets/application.css

Layout/structure via Bootstrap classes in the views

Running in Production
Set environment variables for database and secret key:

DATABASE_USERNAME

DATABASE_PASSWORD

RAILS_ENV=production

SECRET_KEY_BASE (use rails secret to generate)

Run:

bash
rails db:create RAILS_ENV=production
rails db:migrate RAILS_ENV=production
rails assets:precompile RAILS_ENV=production
rails server -e production
Future Enhancements
User accounts and quiz history per user

Timer per quiz

Per-question feedback (show correct answer after submit)

Export results for analysis

API endpoints for quizzes and results

