-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Api.Object.ShapeRectangle exposing (..)

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


kind : SelectionSet (Maybe String) Api.Object.ShapeRectangle
kind =
    Object.selectionForField "(Maybe String)" "kind" [] (Decode.string |> Decode.nullable)


geometry :
    SelectionSet decodesTo Api.Object.RectangleGeometry
    -> SelectionSet (Maybe decodesTo) Api.Object.ShapeRectangle
geometry object_ =
    Object.selectionForCompositeField "geometry" [] object_ (identity >> Decode.nullable)