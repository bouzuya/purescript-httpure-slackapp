module Action.Hello
  ( execute
  ) where

import HTTPure as HTTPure
import View.Hello as ViewHello

execute :: String -> HTTPure.ResponseM
execute name = do
  HTTPure.ok (ViewHello.render name)
