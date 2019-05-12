module Action.Hello
  ( execute
  ) where

import HTTPure as HTTPure
import View.Hello as ViewHello

execute :: String -> HTTPure.ResponseM
execute name = do
  let headers = HTTPure.header "Content-Type" "application/json"
  HTTPure.ok' headers (ViewHello.render name)
