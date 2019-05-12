module View.Hello
  ( render
  ) where

import Prelude

import Simple.JSON as SimpleJSON

render :: String -> String
render name =
  SimpleJSON.writeJSON
    {
      response_type: "ephemeral", -- or "in_channel",
      text: "Hello, " <> name <> "!"
    }
