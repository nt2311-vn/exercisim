# Reverse String

Welcome to Reverse String on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

Reversing strings (reading them from right to left, rather than from left to right) is a surprisingly common task in programming.

For example, in bioinformatics, reversing the sequence of DNA or RNA strings is often important for various analyses, such as finding complementary strands or identifying palindromic sequences that have biological significance.

## Instructions

Your task is to reverse a given string.

Some examples:

- Turn `"stressed"` into `"desserts"`.
- Turn `"strops"` into `"sports"`.
- Turn `"racecar"` into `"racecar"`.

## Bonus

Preserve grapheme clusters, i.e.

```julia
myreverse("hi 👋🏾") == "👋🏾 ih"
myreverse("as⃝df̅") == "f̅ds⃝a"
```

You will probably find the `Unicode` stdlib useful for this bonus task.

To enable the graphemes test, add `const TEST_GRAPHEMES = true` to the global scope of your file.

## Source

### Created by

- @kimttfung

### Contributed to by

- @cmcaine
- @SaschaMann

### Based on

Introductory challenge to reverse an input string - https://medium.freecodecamp.org/how-to-reverse-a-string-in-javascript-in-3-different-ways-75e4763c68cb