module DateOrDateTimeTests exposing (suite)

import DateOrDateTime
import Expect exposing (Expectation)
import Test exposing (Test, describe, test)
import Time


suite : Test
suite =
    describe "DateOrDateTime"
        [ test "toString" <|
            \() ->
                Time.millisToPosix 0
                    |> DateOrDateTime.DateTime
                    |> DateOrDateTime.dateOrDateTimeToIso8601String
                    |> Expect.equal "1970-01-01T00:00:00.000Z"
        ]
