module Main exposing (..)

import Browser
import Element
import Element.Background
import Element.Border
import Element.Font
import Element.Input


main =
    Browser.sandbox
        { init = darkColors
        , view = viewLayout
        , update = update
        }


type Msg
    = MsgChangeColors


update msg model =
    if model.primary == darkColors.primary then
        lightColors

    else
        darkColors


darkColors =
    { primary = Element.rgb255 0xFF 0xAB 0x00
    , primaryLight = Element.rgb255 0xFF 0xDD 0x4B
    , primaryDark = Element.rgb255 0xC6 0x7C 0x00
    , secondary = Element.rgb255 0x3E 0x27 0x23
    , secondaryLight = Element.rgb255 0x6A 0x4F 0x4B
    , secondaryDark = Element.rgb255 0x1B 0x00 0x00
    , textOnPrimary = Element.rgb255 0x00 0x00 0x00
    , textOnSecondary = Element.rgb255 0xFF 0xFF 0xFF
    }


lightColors =
    { secondary = Element.rgb255 0xFF 0xAB 0x00
    , secondaryLight = Element.rgb255 0xFF 0xDD 0x4B
    , secondaryDark = Element.rgb255 0xC6 0x7C 0x00
    , primary = Element.rgb255 0x3E 0x27 0x23
    , primaryLight = Element.rgb255 0x6A 0x4F 0x4B
    , primaryDark = Element.rgb255 0x1B 0x00 0x00
    , textOnSecondary = Element.rgb255 0x00 0x00 0x00
    , textOnPrimary = Element.rgb255 0xFF 0xFF 0xFF
    }


fontGreatVibes =
    Element.Font.family [ Element.Font.typeface "GreatVibes" ]


fontTypewriter =
    Element.Font.family [ Element.Font.typeface "Typewriter" ]


viewLayout model =
    Element.layoutWith
        { options =
            [ Element.focusStyle
                { backgroundColor = Nothing
                , borderColor = Just model.primaryDark
                , shadow = Nothing
                }
            ]
        }
        [ Element.Background.color model.secondaryDark
        , Element.padding 22
        , Element.Font.color model.textOnSecondary
        ]
        (Element.column []
            [ buttonChangeColors model
            , viewTitle model
            , viewSubtitle model
            , dogImage
            , viewContent
            ]
        )


viewTitle model =
    Element.paragraph
        [ Element.Font.bold
        , Element.Font.color model.primary
        , fontGreatVibes
        , Element.Font.size 52
        ]
        [ Element.text "My Dog"
        ]


viewSubtitle model =
    Element.paragraph
        [ Element.Font.color model.primaryLight
        , Element.Font.size 16
        , fontTypewriter
        , Element.paddingXY 0 10
        ]
        [ Element.text "A web page for my dog"
        ]


dogImage =
    Element.image
        [ Element.width (Element.maximum 300 Element.fill)
        , Element.centerX
        ]
        { src = "dog.png"
        , description = "A picture of my dog"
        }


buttonChangeColors model =
    Element.Input.button
        [ Element.Background.color model.primaryLight
        , Element.Border.rounded 8
        , Element.Font.color model.secondaryDark
        , Element.alignRight
        , Element.paddingEach { top = 12, right = 12, bottom = 9, left = 12 }
        , Element.Font.size 16
        , Element.Font.bold
        , Element.mouseOver
            [ Element.Background.color model.primary
            ]
        ]
        { onPress = Just MsgChangeColors
        , label = Element.text "Change colors"
        }


text1 =
    "Chocolate bar shortbread shortbread muffin sugar plum biscuit danish. Cupcake tart powder gummi bears donut cake cotton candy. Marshmallow cotton candy sweet halvah lollipop jujubes. Oat cake macaroon chocolate bar gummies candy canes. Topping cupcake dragée biscuit dragée bonbon biscuit. Soufflé powder jelly-o shortbread toffee apple pie. Soufflé cupcake sesame snaps sweet apple pie chocolate biscuit powder dragée. Jelly cotton candy chocolate tart halvah halvah."


text2 =
    "Sweet croissant pie liquorice pudding carrot cake. Chupa chups dessert pudding danish croissant cotton candy. Gummi bears toffee caramels chocolate oat cake donut soufflé. Lemon drops oat cake sugar plum cotton candy candy brownie pie pastry. Halvah jelly-o cookie gummies chocolate chocolate. Ice cream chocolate bar croissant chocolate sugar plum macaroon sesame snaps cake caramels."


text3 =
    "Danish pie dragée chupa chups sweet jelly-o sweet roll biscuit bonbon. Cheesecake sesame snaps brownie pastry pastry. Jelly-o macaroon tootsie roll cupcake jelly beans candy lemon drops. Sugar plum croissant wafer icing gingerbread carrot cake marzipan. Bear claw sesame snaps cotton candy croissant toffee wafer jujubes jelly ice cream. Bear claw cupcake topping wafer pastry bonbon chocolate cake chocolate gingerbread. Gummi bears soufflé ice cream icing tart jelly beans cheesecake sweet. Chocolate brownie danish powder jelly."


paddingTop size =
    Element.paddingEach { top = size, right = 0, bottom = 0, left = 0 }


viewContent =
    Element.column
        [ fontTypewriter
        , Element.Font.size 16
        , paddingTop 20
        ]
        [ Element.paragraph
            [ Element.paddingXY 0 20
            ]
            [ Element.text text1
            ]
        , Element.paragraph
            [ Element.paddingXY 0 20
            ]
            [ Element.text text2
            ]
        , Element.paragraph
            [ Element.paddingXY 0 20
            ]
            [ Element.text text3
            ]
        ]
