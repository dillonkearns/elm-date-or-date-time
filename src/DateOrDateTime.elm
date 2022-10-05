module DateOrDateTime exposing
    ( DateOrDateTime(..)
    , dateOrDateTimeToIso8601String
    )

{-|

@docs DateOrDateTime

@docs dateOrDateTimeToIso8601String

-}

import Date
import Iso8601
import Time


{-| Represents a Date with an optional time.

    import Date
    import DateOrDateTime
    import Time

    justADate : DateOrDateTime.DateOrDateTime
    justADate =
        DateOrDateTime.Date (Date.fromRataDie 738433)

    aDateWithATime : DateOrDateTime.DateOrDateTime
    aDateWithATime =
        DateOrDateTime.DateTime (Time.millisToPosix 1664987219000)

    justADate |> dateOrDateTimeToIso8601String
    --> "2022-10-05"

    aDateWithATime |> dateOrDateTimeToIso8601String
    --> "2022-10-05T16:26:59.000Z"

-}
type DateOrDateTime
    = Date Date.Date
    | DateTime Time.Posix


{-| A helper for converting to ISO-8601 formatted Strings Date or DateTime Strings.
-}
dateOrDateTimeToIso8601String : DateOrDateTime -> String
dateOrDateTimeToIso8601String dateOrDateTime =
    case dateOrDateTime of
        Date date ->
            Date.toIsoString date

        DateTime dateTime ->
            Iso8601.fromTime dateTime
