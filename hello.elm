module Main exposing (Model, Msg(..), init, main, subscriptions, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


type alias Model =
    { message : String }


type Msg
    = SayHello String
    | SayBye


init : ( Model, Cmd Msg )
init =
    ( { message = "" }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SayHello greeted ->
            ( { model | message = "こんにちは" ++ greeted }, Cmd.none )

        SayBye ->
            ( { model | message = "さようなら" }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick (SayHello "世界樹") ] [ text "hello" ]
        , button [ onClick SayBye ] [ text "bye" ]
        , span [ class "blue" ] [ text model.message ]
        ]
