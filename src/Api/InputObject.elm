-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Api.InputObject exposing (..)

import Api.Interface
import Api.Object
import Api.Scalar
import Api.ScalarCodecs
import Api.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


buildShapeInput :
    (ShapeInputOptionalFields -> ShapeInputOptionalFields)
    -> ShapeInput
buildShapeInput fillOptionals =
    let
        optionals =
            fillOptionals
                { kind = Absent, geometry = Absent }
    in
    { kind = optionals.kind, geometry = optionals.geometry }


type alias ShapeInputOptionalFields =
    { kind : OptionalArgument String
    , geometry : OptionalArgument (List (Maybe (List (Maybe Float))))
    }


{-| Type for the ShapeInput input object.
-}
type alias ShapeInput =
    { kind : OptionalArgument String
    , geometry : OptionalArgument (List (Maybe (List (Maybe Float))))
    }


{-| Encode a ShapeInput into a value that can be used as an argument.
-}
encodeShapeInput : ShapeInput -> Value
encodeShapeInput input =
    Encode.maybeObject
        [ ( "kind", Encode.string |> Encode.optional input.kind ), ( "geometry", (Encode.float |> Encode.maybe |> Encode.maybe |> Encode.list |> Encode.list) |> Encode.optional input.geometry ) ]
