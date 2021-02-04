-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Api.Object.InspectionConnection exposing (..)

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


pageInfo :
    SelectionSet decodesTo Api.Object.PageInfo
    -> SelectionSet decodesTo Api.Object.InspectionConnection
pageInfo object_ =
    Object.selectionForCompositeField "pageInfo" [] object_ identity


edges :
    SelectionSet decodesTo Api.Object.InspectionEdge
    -> SelectionSet (Maybe (List (Maybe decodesTo))) Api.Object.InspectionConnection
edges object_ =
    Object.selectionForCompositeField "edges" [] object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)