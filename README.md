# dom-events

Dom events translated to Haskell.

Some features:
- Translates the most common DOM events to Haskell types.
- Uses type variables for all fields that have DOM-specific types. For example, `target` is of type `s` where `s` is up to the person using this library.

TODO:
- create typeclasses for `Event`, `UIEvent` and `MouseEvent` and make each Event an instance of the appropriate class.