module Main exposing (Model, Msg(..), init, main, update, view)

import Api.InputObject
    exposing
        ( UserInput
        , buildUserInput
        )
import Api.Mutation as Mutation exposing (CreateUserRequiredArguments, createUser)
import Browser
import Graphql.Http
import Graphql.Operation exposing (RootMutation, RootQuery)
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    Int


init : Model
init =
    0



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+" ]
        ]
