module Maybe.Extras (bind) where


bind : (a -> Maybe b) -> Maybe a -> Maybe b
bind f x =
  Maybe.andThen x f
