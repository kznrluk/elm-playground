module Main exposing (..)

import Browser
import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (checked, style, type_)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { value : Int
    , oneHundred : Bool
    }


init : Model
init =
    { value = 0
    , oneHundred = False
    }


type Msg
    = Increment
    | Decrement
    | Reset
    | Checked


update : Msg -> Model -> Model
update msg model =
    let
        mos =
            if model.oneHundred then
                100

            else
                1
    in
    case msg of
        Increment ->
            { model | value = model.value + mos }

        Decrement ->
            { model | value = model.value - mos }

        Reset ->
            { model | value = init.value }

        Checked ->
            { model | oneHundred = not model.oneHundred }


buttonStyle: Html.Attribute msg
buttonStyle =
    style "font-size" "2rem"


view : Model -> Html Msg
view model =
    div []
        [ button [ buttonStyle, onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model.value) ]
        , button [ buttonStyle, onClick Increment ] [ text "+" ]
        , button [ buttonStyle, onClick Reset ] [ text "res" ]
        , input [ type_ "checkbox", onClick Checked ] []
        ]
