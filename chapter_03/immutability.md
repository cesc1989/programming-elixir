## Immutability

### Immutable Data is Known Data

> Elixir sidesteps these problems. In Elixir, all values are immutable. THe most complex nested list, the database record--these things behave just like the simplest integer. Their values are all immutable.
>
> In Elixir, once a variable references a list such as `[1, 2, 3]`, you know it will always reference those same values (until you rebind the variable). And this makes concurrency a lot less frightening.

### Performance Implications of Immutability

#### Copying Data

> Because Elixir know that existing data is immutable, it can reuse it, in part or as a whole, when building new structures.

#### Garbage Collection

> But the cool thing about Elixir is that you write your code using lots and lots of processes, and each process has its own heap. The data in your application is divvied up between these processes, so each individual heap is much, much smaller than would have been the case if all the data had been in a single heap. As a result, garbage collection runs faster. And when a process terminates before its heap becomes full, all its data is discarded--no garbage collection is required.

#### Coding with Immutabile Data

> Once you accept the concept, coding with immutable data is surprisingly easy. You just have to remember that any function that transforms data will return a new copy of it. Thus, we never capitalize a string. Instead, we return a capitalized copy of a string.
