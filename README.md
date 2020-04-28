# Week 4 Project


This is a gym recording keeping system intended for a gym owner to create customers and lessons then allocate customers to lessons.

[The brief] (https://github.com/codeclan/e39_classnotes/blob/master/week_04/projects/bank/Gym.md)


To run this software you need to have Ruby and PostGreSQL installed.

You also need the following gems installed
```
gem install pg sinatra sinatra-contrib
```


You need to have a database called week4_project
```
createdb week4_project
```

Then run the table creating script
```
psql -d week4_project db/table_maker.sql
```

Run the following in the terminal and visit the browser at localhost:4567
```
ruby runner.rb
```



### Optional testing software
```
gem install minitest minitest-reporters
```
The following modules can be run like this
```
ruby modules/specs/customer_spec
ruby modules/specs/customer_lesson_spec
ruby modules/specs/lesson_spec
```