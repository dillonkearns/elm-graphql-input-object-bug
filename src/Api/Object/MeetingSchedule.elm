-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Api.Object.MeetingSchedule exposing (..)

import Api.InputObject
import Api.Interface
import Api.Object
import Api.Scalar
import Api.ScalarCodecs
import Api.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| The ID of an object
-}
id : SelectionSet Api.ScalarCodecs.Id Api.Object.MeetingSchedule
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Api.ScalarCodecs.codecs |> Api.Scalar.unwrapCodecs |> .codecId |> .decoder)


name : SelectionSet (Maybe String) Api.Object.MeetingSchedule
name =
    Object.selectionForField "(Maybe String)" "name" [] (Decode.string |> Decode.nullable)


deadlineDays : SelectionSet (Maybe Int) Api.Object.MeetingSchedule
deadlineDays =
    Object.selectionForField "(Maybe Int)" "deadlineDays" [] (Decode.int |> Decode.nullable)


startDatetime : SelectionSet (Maybe String) Api.Object.MeetingSchedule
startDatetime =
    Object.selectionForField "(Maybe String)" "startDatetime" [] (Decode.string |> Decode.nullable)


frequency : SelectionSet (Maybe String) Api.Object.MeetingSchedule
frequency =
    Object.selectionForField "(Maybe String)" "frequency" [] (Decode.string |> Decode.nullable)


interval : SelectionSet (Maybe Int) Api.Object.MeetingSchedule
interval =
    Object.selectionForField "(Maybe Int)" "interval" [] (Decode.int |> Decode.nullable)


positions : SelectionSet (Maybe (List (Maybe Int))) Api.Object.MeetingSchedule
positions =
    Object.selectionForField "(Maybe (List (Maybe Int)))" "positions" [] (Decode.int |> Decode.nullable |> Decode.list |> Decode.nullable)


daysOfTheWeek : SelectionSet (Maybe (List (Maybe Int))) Api.Object.MeetingSchedule
daysOfTheWeek =
    Object.selectionForField "(Maybe (List (Maybe Int)))" "daysOfTheWeek" [] (Decode.int |> Decode.nullable |> Decode.list |> Decode.nullable)


daysOfTheMonth : SelectionSet (Maybe (List (Maybe Int))) Api.Object.MeetingSchedule
daysOfTheMonth =
    Object.selectionForField "(Maybe (List (Maybe Int)))" "daysOfTheMonth" [] (Decode.int |> Decode.nullable |> Decode.list |> Decode.nullable)


daysOfTheYear : SelectionSet (Maybe (List (Maybe Int))) Api.Object.MeetingSchedule
daysOfTheYear =
    Object.selectionForField "(Maybe (List (Maybe Int)))" "daysOfTheYear" [] (Decode.int |> Decode.nullable |> Decode.list |> Decode.nullable)


weeksOfTheYear : SelectionSet (Maybe (List (Maybe Int))) Api.Object.MeetingSchedule
weeksOfTheYear =
    Object.selectionForField "(Maybe (List (Maybe Int)))" "weeksOfTheYear" [] (Decode.int |> Decode.nullable |> Decode.list |> Decode.nullable)


monthsOfTheYear : SelectionSet (Maybe (List (Maybe Int))) Api.Object.MeetingSchedule
monthsOfTheYear =
    Object.selectionForField "(Maybe (List (Maybe Int)))" "monthsOfTheYear" [] (Decode.int |> Decode.nullable |> Decode.list |> Decode.nullable)


insertedAt : SelectionSet (Maybe String) Api.Object.MeetingSchedule
insertedAt =
    Object.selectionForField "(Maybe String)" "insertedAt" [] (Decode.string |> Decode.nullable)


updatedAt : SelectionSet (Maybe String) Api.Object.MeetingSchedule
updatedAt =
    Object.selectionForField "(Maybe String)" "updatedAt" [] (Decode.string |> Decode.nullable)