module Action
  ( Action(..)
  , execute
  ) where

import Prelude

import Action.Hello as ActionHello
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import HTTPure (ResponseM)

data Action
  = Hello String

derive instance eqAction :: Eq Action
derive instance genericAction :: Generic Action _
instance showAction :: Show Action where
  show = genericShow

execute :: Action -> ResponseM
execute =
  case _ of
    Hello name -> ActionHello.execute name
