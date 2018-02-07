{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

import Yesod

-- data Helloworld= Helloworld

-- mkYesod "Helloworld" [parseRoutes|
-- / HomeR GET
-- |]

-- instance Yesod Helloworld




data Links = Links

mkYesod "Links" [parseRoutes|
/ HomeR GET
/page1 Page1R GET
/page2 Page2R GET
|]
getHomeR = defaultLayout [whamlet|<a href=@{Page1R}>go to page 1 |]
getPage1R = defaultLayout [whamlet|<a href=@{Page2R}>go to page 2|]
getPage2R = defaultLayout [whamlet|<a href=@{HomeR}>go to home|]

instance Yesod Links  
main :: IO ()
main =do
  putStrLn (show (renderRoute Page1R))
  warp 9000 Links


