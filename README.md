# Closswift

A simple Swift utility for conditionally joining classNames together.

## How to use

```swift
import Closswift

// Strings (variadic)
let bar: Optional<String> = "bar"
closs("foo", bar, "baz");
//=> "foo bar baz"

// Dictionaries
closs(["foo" : true, "bar" : false], ["baz" : isTrue()]))
//=> "foo baz"

// Dictionaries (variadic)
closs(["foo" : true], ["bar" : false], String?.none, ["--foobar" : true])
//=> "foo --foobar"

// Arrays
closs("foo", 0 , false, "bar")
//=> "foo bar"

// Arrays (variadic)
closs(["foo"], ["", 0, false, "bar"])
//=> "foo bar"
```

## Details

### closs(...input)

Returns: `String`

#### input

Type: `ClosswiftCombinable` 
(Conform to 'Array, String, Optional, Bool, Dictionary')
