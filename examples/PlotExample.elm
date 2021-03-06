module PlotExample exposing (..)

import Plot
import Svg
import Svg.Attributes
import Html exposing (Html)
import Html.App as App


myCustomTick : Plot.Point -> Plot.Point -> Svg.Svg a
myCustomTick (x1, y1) (x2, y2) =
    Svg.g []
        [ Svg.line
            [ Svg.Attributes.style "stroke: red;"
            , Svg.Attributes.x1 (toString x1)
            , Svg.Attributes.y1 (toString y1)
            , Svg.Attributes.x2 (toString x2)
            , Svg.Attributes.y2 (toString y2)
            ]
            []
        ]


areaData =
    [ (-50, 34), (-30, 432), (-20, 35), (2, 546), (10, 345), (30, 42), (90, 67), (120, 50) ]


lineData =
    [ (-50, 34), (-30, 32), (-20, 5), (2, -46), (10, -99), (30, -136), (90, -67), (120, 10) ]


view : Plot.State -> Html Plot.Msg
view state =
    Plot.plot
        state
        [ Plot.dimensions (800, 500) ]
        [ Plot.area [ Plot.stroke "cornflowerblue", Plot.fill "#ccdeff" ] areaData
        , Plot.line [ Plot.stroke "mediumvioletred" ] lineData
        , Plot.xAxis [ Plot.viewTick myCustomTick ]
        , Plot.yAxis [ Plot.amountOfTicks 5 ]
        ]
   

main =
  App.beginnerProgram
    { model = Plot.init
    , update = Plot.update
    , view = view
    }     
