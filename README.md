# `dillonkearns/elm-date-or-date-time` [![Build Status](https://github.com/dillonkearns/elm-date-or-date-time/workflows/CI/badge.svg)](https://github.com/dillonkearns/elm-date-or-date-time/actions?query=branch%3Amain)

A simple type for a Date with an optional time. The type is:

```elm
type DateOrDateTime
    = Date Date.Date -- from `justinmimbs/date`
    | DateTime Time.Posix -- from `elm install elm/time`
```

The types are exposed directly so you can create them using `DateOrDateTime.Date` and `DateOrDateTime.DateTime`, and
you can pattern match on them in a `case` expression.

The main purpose of this package is to have a shared type that can be used between APIs so package authors don't need to
re-define the same type, and users can use the same type with multiple packages.

## Example


```elm
import Date
import DateOrDateTime
import Time

justADate : DateOrDateTime.DateOrDateTime
justADate =
    DateOrDateTime.Date (Date.fromRataDie 738433)

aDateWithATime : DateOrDateTime.DateOrDateTime
aDateWithATime =
    DateOrDateTime.DateTime (Time.millisToPosix 1664987219000)

justADate |> DateOrDateTime.toIso8601
--> "2022-10-05"

aDateWithATime |> DateOrDateTime.toIso8601
--> "2022-10-05T16:26:59.000Z"
```
