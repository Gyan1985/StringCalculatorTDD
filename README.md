# String Calculator TDD Kata

String Calculator which convert string of number into number and perform various opertaions on it. See below example

```bash
int add(string numbers)

Input: a string of comma separated numbers
Output: an integer, sum of the numbers

Examples:
Input: "", "1", "1,5"
Output: 0, 1, 6
```

## Installation

Clone this repository :

```bash
git clone https://github.com/Gyan1985/StringCalculatorTDD.git

```

## Setup
#### Install dependencies
```bundle install
```

#### To run test cases
```rspec
```

#### For linter
```rubocop
```

## Run the application

#### Input : Empty string
```ruby 
ruby main.rb ""
Calculating for: 
Result: 0
```

#### Input : Single number
```ruby 
ruby main.rb "1"
Calculating for: 1
Result: 6
```

#### Input : Multiple numbers
```ruby 
ruby main.rb "1,2,3"
Calculating for: 1,2,3
Result: 6
```

#### Input : Newline separated numbers
```ruby 
ruby main.rb "1\n2\n3"
Calculating for: 1,2,3
Result: 6
```

#### Input : Custom delimiter with string
```ruby 
ruby main.rb "//;\n1;2;3"
Calculating for: 1,2,3
Result: 6
```

#### Input : Negative Numbers String
```ruby
ruby main.rb "1,-2,-3,4"
Output:
Calculating for: 1,-2,3,-4
Error: Negative numbers not allowed: -2, -4
```
