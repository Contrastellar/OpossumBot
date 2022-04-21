{-# LANGUAGE OverloadedStrings #-}

import           Control.Monad (when, void)
import           UnliftIO (liftIO)
import qualified Data.Text.IO as TIO
import           Data.Text (isPrefixOf, toLower, Text)
import qualified Data.Map as Map
import           System.Directory
import           System.Random
import qualified Data.ByteString as B

import           Discord
import           Discord.Types
import qualified Discord.Requests as R

import PossumLib

main :: IO ()
main = do
    tok <- TIO.readFile "/home/contrastellar/PossumBot/DiscordToken.txt"
    let conf :: DiscordConfig
        conf = DiscordConfig
            { botPrefix = "!"
            , botToken = tok
            , botCommands = commands }
    discordEntry conf

commands :: Map.Map Text (Message -> DiscordHandler ()) 
commands = Map.fromList 
    [   ("possum",
            \mess -> do
                dir <- liftIO $ listDirectory "/home/contrastellar/PossumBot/img/possum/"
                filePath <- liftIO $atRandIndex dir
                file <- liftIO $ B.readFile filePath
                let opts :: R.MessageDetailedOpts
                    opts = def { R.messageDetailedFile = Just ("", file) }
                void $ restCall (R.CreateMessageDetailed (messageChannelId mess) opts)
        )
    ,   ("pccommands", 
            \mess ->  void $ restCall $ R.CreateMessage  (messageChannelId mess) 
                "only !possum aaaaaa"
        )
    ,   ("vibe", 
            \mess ->  void $ restCall $ R.CreateMessage  (messageChannelId mess) 
                "https://cdn.discordapp.com/attachments/547164475535523890/735923050696015903/1593712826771.mp4"
        )
    ,   ("wheel",
            \mess ->  void $ restCall $ R.CreateMessage  (messageChannelId mess) 
                "https://cdn.discordapp.com/attachments/161297309978591233/903331498294390794/video0_13.mp4"
        )
    ,   ("honk",
            \mess ->  do 
                file <- liftIO $ B.readFile "./img/HONK.jpg"
                let opts :: R.MessageDetailedOpts
                    opts = def { R.messageDetailedFile = Just ("", file) }
                void $ restCall (R.CreateMessageDetailed (messageChannelId mess) opts)
        )
    ,   ("stroll",
            \mess ->  void $ restCall $ R.CreateMessage  (messageChannelId mess) 
                "https://cdn.discordapp.com/attachments/743621304246206494/937426290296881163/video0-5_1.mov"
        )
    ,   ("crypto",
            \mess ->  void $ restCall $ R.CreateMessage  (messageChannelId mess) 
                "https://cdn.discordapp.com/attachments/812580457719005206/926519160014516284/jpZySFGv8ZiWcX40.mp4"
        )
    ,   ("metar",
            \mess ->  void $ restCall $ R.CreateMessage  (messageChannelId mess) 
                "WHAT THE FUCK IS WEATHER AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
        )
    ]

-- Gets random thing in list. I hope it's not an infinite list.
atRandIndex :: [a] -> IO a 
atRandIndex l = do
    i <- randomRIO (0, length l - 1)
    return $ l !! i