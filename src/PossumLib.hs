{-# LANGUAGE OverloadedStrings #-}

module PossumLib
    ( discordEntry
    , DiscordConfig (DiscordConfig)
    , botPrefix
    , botToken
    , botCommands
    ) where

import           Control.Monad (when, void)
import           UnliftIO (liftIO)
import           UnliftIO.Concurrent
import qualified Data.Text.IO as TIO
import qualified Data.Text as Text
import           Data.Text (isPrefixOf, toLower, Text)

import           Discord
import           Discord.Types
import qualified Discord.Requests as R

import qualified Data.Map as Map

data DiscordConfig = DiscordConfig
    { botPrefix   :: Text
    , botToken    :: Text
    , botCommands :: Map.Map Text (Message -> DiscordHandler ())
    }

discordEntry :: DiscordConfig -> IO ()
discordEntry conf = do
    err <- runDiscord $ def { discordToken = botToken conf
                            , discordOnStart = startHandler
                            , discordOnEvent = eventHandler (botCommands conf) $ hasPrefix $ botPrefix conf
                            , discordOnEnd = endHandler
                            , discordOnLog = \s -> TIO.putStrLn s >> TIO.putStrLn ""
                            }
    TIO.putStrLn err

startHandler :: DiscordHandler ()
startHandler = do
    liftIO $ putStrLn "Started"

endHandler :: IO ()
endHandler = putStrLn "Ended"

eventHandler :: Map.Map Text (Message -> DiscordHandler ())  -> (Message -> Bool) -> Event -> DiscordHandler ()
eventHandler cmds preCheck event = case event of
    MessageCreate m -> when (preCheck m) $ do
        case Map.lookup (Text.drop 1 (messageContent m)) cmds of
            Just f -> f m
            Nothing -> return ()
    _ -> return ()

hasPrefix :: Text -> Message -> Bool 
hasPrefix prefix = (prefix `isPrefixOf`) . toLower . messageContent

fromBot :: Message -> Bool
fromBot = userIsBot . messageAuthor

