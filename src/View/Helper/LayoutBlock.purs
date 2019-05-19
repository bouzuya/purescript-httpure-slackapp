-- https://api.slack.com/reference/messaging/blocks
module View.Helper.LayoutBlock
  ( LayoutBlock
  , actionsBlock
  , sectionBlock
  ) where

import Data.Maybe (Maybe)
import Data.Maybe as Maybe
import Simple.JSON (class WriteForeign)
import Simple.JSON as SimpleJSON
import View.Helper.BlockElement (BlockElement)
import View.Helper.TextObject (TextObject)

type SectionBlockJSON =
  { type :: String -- "section"
  , text :: TextObject -- length text <= 3000
  , block_id :: Maybe String -- length block_id <= 255
  -- length fields <= 10 && length fields[i].text <= 2000
  , fields :: Maybe (Array TextObject)
  , accessory :: Maybe BlockElement
  }

type ActionsBlockJSON =
  { type :: String -- "actions"
  , elements :: Array BlockElement -- length elements <= 5
  , block_id :: Maybe String -- length block_id <= 255
  }

data LayoutBlock
  = SectionBlock SectionBlockJSON
  -- | Divider
  -- | Image
  | ActionsBlock ActionsBlockJSON
  -- | Context

instance writeForeignLayoutBlock :: WriteForeign LayoutBlock where
  writeImpl = case _ of
    (SectionBlock r) -> SimpleJSON.writeImpl r
    (ActionsBlock r) -> SimpleJSON.writeImpl r

actionsBlock :: { elements :: Array BlockElement } -> LayoutBlock
actionsBlock { elements } = ActionsBlock
  { type: "actions"
  , elements
  , block_id: Maybe.Nothing -- not supported
  }

sectionBlock :: { text :: TextObject } -> LayoutBlock
sectionBlock { text } = SectionBlock
  { type: "section"
  , text
  , block_id: Maybe.Nothing -- not supported
  , fields: Maybe.Nothing -- not supported
  , accessory: Maybe.Nothing -- not supported
  }
