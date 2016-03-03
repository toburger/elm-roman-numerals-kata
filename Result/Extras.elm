module Result.Extras (bind) where


bind : (a -> Result b c) -> Result b a -> Result b c
bind f x =
  Result.andThen x f
