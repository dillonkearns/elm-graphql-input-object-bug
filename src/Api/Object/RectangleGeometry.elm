-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Api.Object.RectangleGeometry exposing (..)

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


x : SelectionSet (Maybe Float) Api.Object.RectangleGeometry
x =
    Object.selectionForField "(Maybe Float)" "x" [] (Decode.float |> Decode.nullable)


y : SelectionSet (Maybe Float) Api.Object.RectangleGeometry
y =
    Object.selectionForField "(Maybe Float)" "y" [] (Decode.float |> Decode.nullable)


width : SelectionSet (Maybe Float) Api.Object.RectangleGeometry
width =
    Object.selectionForField "(Maybe Float)" "width" [] (Decode.float |> Decode.nullable)


height : SelectionSet (Maybe Float) Api.Object.RectangleGeometry
height =
    Object.selectionForField "(Maybe Float)" "height" [] (Decode.float |> Decode.nullable)
