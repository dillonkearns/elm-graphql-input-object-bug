-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Api.Object.Submission exposing (..)

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
id : SelectionSet Api.ScalarCodecs.Id Api.Object.Submission
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Api.ScalarCodecs.codecs |> Api.Scalar.unwrapCodecs |> .codecId |> .decoder)


internalId : SelectionSet (Maybe String) Api.Object.Submission
internalId =
    Object.selectionForField "(Maybe String)" "internalId" [] (Decode.string |> Decode.nullable)


commentCount : SelectionSet (Maybe Int) Api.Object.Submission
commentCount =
    Object.selectionForField "(Maybe Int)" "commentCount" [] (Decode.int |> Decode.nullable)


formData :
    SelectionSet decodesTo Api.Object.FormField
    -> SelectionSet (Maybe (List (Maybe decodesTo))) Api.Object.Submission
formData object_ =
    Object.selectionForCompositeField "formData" [] object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


insertedAt : SelectionSet (Maybe Api.ScalarCodecs.DateTime) Api.Object.Submission
insertedAt =
    Object.selectionForField "(Maybe ScalarCodecs.DateTime)" "insertedAt" [] (Api.ScalarCodecs.codecs |> Api.Scalar.unwrapCodecs |> .codecDateTime |> .decoder |> Decode.nullable)


updatedAt : SelectionSet (Maybe Api.ScalarCodecs.DateTime) Api.Object.Submission
updatedAt =
    Object.selectionForField "(Maybe ScalarCodecs.DateTime)" "updatedAt" [] (Api.ScalarCodecs.codecs |> Api.Scalar.unwrapCodecs |> .codecDateTime |> .decoder |> Decode.nullable)


projectStep :
    SelectionSet decodesTo Api.Object.ProjectStep
    -> SelectionSet (Maybe decodesTo) Api.Object.Submission
projectStep object_ =
    Object.selectionForCompositeField "projectStep" [] object_ (identity >> Decode.nullable)


form :
    SelectionSet decodesTo Api.Object.Form
    -> SelectionSet (Maybe decodesTo) Api.Object.Submission
form object_ =
    Object.selectionForCompositeField "form" [] object_ (identity >> Decode.nullable)


documents :
    SelectionSet decodesTo Api.Object.Document
    -> SelectionSet (Maybe (List (Maybe decodesTo))) Api.Object.Submission
documents object_ =
    Object.selectionForCompositeField "documents" [] object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


issues :
    SelectionSet decodesTo Api.Object.Issue
    -> SelectionSet (Maybe (List (Maybe decodesTo))) Api.Object.Submission
issues object_ =
    Object.selectionForCompositeField "issues" [] object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)
