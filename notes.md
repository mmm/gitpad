
ok, so this needs to be simple to start...

regularly run:

    lp:charm/xxx.each 

      cache dir exists?
        pull from lp
      else
        clone from lp

      find or create github remote
      add it

      pull github remote

      merge

      push up to github remote

      problems?
        just wipe github version and push fresh
