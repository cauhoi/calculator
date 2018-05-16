# String Calculator


This is a Rails app for calculating string input using my own implementation of operators (such as +, -, /,*) on any number of integer arguments.

Input example:
```
5*3+1+6/2+9*100
```

Expected output:
```
5*3+1+6/2+9*100
919
```
### Setup
```
- Download into your directory of your choice.
- Run bundle (install)
- Run "rails s'

Go to localhost:3000/ and you should see the calculator page
Make sure your browser support AJAX
```
## Running the tests

```
rails test test/helpers/application_helper_test.rb
```
