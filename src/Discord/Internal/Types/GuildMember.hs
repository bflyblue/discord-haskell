{-# LANGUAGE OverloadedStrings #-}

module Discord.Internal.Types.GuildMember where

import Data.Time.Clock

import Data.Aeson
import qualified Data.Text as T

import Discord.Internal.Types.Prelude
import Discord.Internal.Types.User (User)

-- | Representation of a guild member.
data GuildMember = GuildMember
      { memberUser     :: Maybe User
      , memberNick     :: Maybe T.Text
      , memberRoles    :: [Snowflake]
      , memberJoinedAt :: UTCTime
      , memberDeaf     :: Bool
      , memberMute     :: Bool
      } deriving (Show, Eq, Ord)

instance FromJSON GuildMember where
  parseJSON = withObject "GuildMember" $ \o ->
    GuildMember <$> o .:? "user"
                <*> o .:? "nick"
                <*> o .:  "roles"
                <*> o .:  "joined_at"
                <*> o .:  "deaf"
                <*> o .:  "mute"