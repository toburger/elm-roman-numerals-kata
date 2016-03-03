module Romans (..) where


toRomanP : Int -> ( String, String, String ) -> String
toRomanP arabic ( one, five, ten ) =
  case arabic of
    0 ->
      ""

    1 ->
      one

    2 ->
      one ++ one

    3 ->
      one ++ one ++ one

    4 ->
      one ++ five

    5 ->
      five

    6 ->
      five ++ one

    7 ->
      five ++ one ++ one

    8 ->
      five ++ one ++ one ++ one

    9 ->
      one ++ ten

    _ ->
      ""


toRoman : Int -> String
toRoman arabic =
  let
    ones =
      toRomanP (arabic % 10) ( "I", "V", "X" )

    tens =
      toRomanP ((arabic // 10) % 10) ( "X", "L", "C" )

    hundreds =
      toRomanP ((arabic // 100) % 10) ( "C", "D", "M" )

    thousands =
      toRomanP ((arabic // 1000) % 10) ( "M", "MMMMM", "MMMMMMMMMM" )
  in
    thousands ++ hundreds ++ tens ++ ones
