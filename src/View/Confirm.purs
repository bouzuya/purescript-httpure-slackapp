module View.Confirm
  ( render
  ) where

import Data.Maybe as Maybe
import Simple.JSON as SimpleJSON
import View.Helper.Block as Block
import View.Helper.BlockElement as BlockElement
import View.Helper.TextObject as TextObject

render :: String
render =
  SimpleJSON.writeJSON
    {
      response_type: "ephemeral", -- or "in_channel",
      blocks:
      [ Block.sectionBlock
        { text:
          TextObject.plainText { text: "confirm!" }
        }
      , Block.actionsBlock
        { elements:
          [ BlockElement.linkButton
              { text: "Link"
              , emoji: Maybe.Just true
              , action_id: "link"
              , url: "http://example.com/"
              , style: Maybe.Nothing
              }
          , BlockElement.actionButton
            { text: "Cancel"
            , emoji: Maybe.Just true
            , action_id: "cancel"
            , value: Maybe.Nothing
            , style: Maybe.Nothing
            }
          , BlockElement.actionButton
            { text: "OK"
            , emoji: Maybe.Just true
            , action_id: "ok"
            , value: Maybe.Nothing
            , style: Maybe.Just "primary"
            }
          ]
        }
      ]
    }
