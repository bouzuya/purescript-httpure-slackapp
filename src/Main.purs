module Main
  ( main
  ) where

import Prelude

import Action as Action
import Data.Either as Either
import Effect (Effect)
import Effect.Console as Console
import HTTPure (Request, ResponseM, ServerM)
import HTTPure as HTTPure
import Router as Router

main :: ServerM -- Effect Unit
main = HTTPure.serve port app booted
  where
    app :: Request -> ResponseM
    app request =
      case Router.router request of
        Either.Right action -> Action.execute action
        Either.Left (Router.ClientError _) ->
          HTTPure.badRequest "invalid params"
        Either.Left Router.NotFound ->
          HTTPure.notFound

    booted :: Effect Unit
    booted = Console.log "Server now up on port 8080"

    port :: Int
    port = 8080
