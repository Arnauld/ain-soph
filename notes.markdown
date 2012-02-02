List all user based library and clean up!

    $ ghc-pkg list > ghc-pkg.list && subl ghc-pkg.list

    $ ghc-pkg unregister --user --force unordered-containers-0.1.4.6
    $ ghc-pkg unregister --user --force vector-0.9.1
    $ ghc-pkg unregister --user --force xml-conduit-0.5.2
    $ ghc-pkg unregister --user --force xml-types-0.3.1
    $ ghc-pkg unregister --user --force yaml-0.5.2
    $ ...

Let's install `yesod`

    $ cabal install yesod
    Resolving dependencies...
    cabal: cannot configure xml-conduit-0.5.2. It requires 
    attoparsec-conduit ==0.2.*, blaze-builder-conduit ==0.2.* and conduit ==0.2.*
    
    For the dependency on attoparsec-conduit ==0.2.* there are these packages:
    attoparsec-conduit-0.2.0. However none of them are available.
    attoparsec-conduit-0.2.0 was excluded because yesod-json-0.3.0 requires attoparsec-conduit ==0.0.*
    
    For the dependency on blaze-builder-conduit ==0.2.* there are these packages:
    blaze-builder-conduit-0.2.0. However none of them are available.
    blaze-builder-conduit-0.2.0 was excluded because authenticate-1.0.0 requires blaze-builder-conduit ==0.0.*
    
    For the dependency on conduit ==0.2.* there are these packages: conduit-0.2.0.
    However none of them are available.
    conduit-0.2.0 was excluded because persistent-0.7.0.1 requires conduit >=0.0 && <0.2
    conduit-0.2.0 was excluded because yesod-json-0.3.0 requires conduit >=0.0 && <0.2
    conduit-0.2.0 was excluded because yesod-core-0.10.0 requires conduit >=0.0 && <0.2
    conduit-0.2.0 was excluded because authenticate-1.0.0 requires conduit >=0.0 && <0.2

Look for an available version of `xml-conduite` 
Search for `xml-conduite` [here](http://holumbus.fh-wedel.de/hayoo/hayoo.html) then jump [there](http://hackage.haskell.org/package/xml-conduit-0.5.2) to find a version that rely on a previous version of `conduit` lower than 0.2.0, found: `0.5.1.2 `

    $ cabal install --constraint='xml-conduit ==0.5.1.2' yesod
    Resolving dependencies...
    cabal: cannot configure http-conduit-1.2.1. It requires 
    attoparsec-conduit ==0.2.*, blaze-builder-conduit ==0.2.* and conduit >=0.2
    
    For the dependency on attoparsec-conduit ==0.2.* there are these packages:
    attoparsec-conduit-0.2.0. However none of them are available.
    attoparsec-conduit-0.2.0 was excluded because yesod-json-0.3.0 requires
    attoparsec-conduit ==0.0.*
    attoparsec-conduit-0.2.0 was excluded because xml-conduit-0.5.1.2 requires
    attoparsec-conduit >=0.0.0.1 && <0.1
    
    For the dependency on blaze-builder-conduit ==0.2.* there are these packages:
    blaze-builder-conduit-0.2.0. However none of them are available.
    blaze-builder-conduit-0.2.0 was excluded because xml-conduit-0.5.1.2 requires
    blaze-builder-conduit ==0.0.*
    blaze-builder-conduit-0.2.0 was excluded because authenticate-1.0.0 requires
    blaze-builder-conduit ==0.0.*
    
    For the dependency on conduit >=0.2 there are these packages: conduit-0.2.0.
    However none of them are available.
    conduit-0.2.0 was excluded because persistent-0.7.0.1 requires conduit >=0.0 && <0.2
    conduit-0.2.0 was excluded because yesod-json-0.3.0 requires conduit >=0.0 && <0.2
    conduit-0.2.0 was excluded because yesod-core-0.10.0 requires conduit >=0.0 && <0.2
    conduit-0.2.0 was excluded because authenticate-1.0.0 requires conduit >=0.0 && <0.2

Search for `http-conduit`, one arrives [there](http://hackage.haskell.org/package/http-conduit) and found: `1.2.0`

    $ cabal install --constraint='xml-conduit ==0.5.1.2' --constraint='http-conduit ==1.2.0' yesod
