
## When indentation is modified?

- previous {  -> increase
- previous (  -> increase
- previous (.+  -> column position of (
- present }   -> matching }
- previous unfinished one line `statement` -> increase
- previous finishes one line `statement` -> begin of one line `statement`
- previous ,
  - if previous begin of `[,( -> column position of [,(`
  - previous

## Rules

### for, if, else, while, function: (), {}

- identify `if` inside curly brackets
  - `increase` indentation of `opening` brackets
- `if` `closing` brackets
  - get indentation of `opening` brackets
- `if` previous `closing` brackets
  - repeat indentation

- if previous non-white is command with one line
  - `increase` indentation of previous non-white

### subset: [

- if previous non-white `[` but also `(,{,[`
  - `increase` indentation of `opening` brackets

- if previous non-white `,`
  - indentation is column position of `(,[`
