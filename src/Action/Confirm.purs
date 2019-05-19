module Action.Confirm
  ( execute
  ) where

import HTTPure as HTTPure
import View.Confirm as ViewConfirm

execute :: HTTPure.ResponseM
execute = do
  let headers = HTTPure.header "Content-Type" "application/json"
  HTTPure.ok' headers ViewConfirm.render
