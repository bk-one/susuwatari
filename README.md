Susuwatari
===

Susuwatari (ススワタリ lit. meaning "travelling soot") is the name of the dust bunnies featured in [Studio Ghibli](http://en.wikipedia.org/wiki/Studio_Ghibli) Animes _My Neighbour Totoro_ and _Spirited Away_. 


An Introduction for the Impatient (tl;dr)
---

This gem allows you to use the API of Patrick Meenan excellent [webpagetest.org](http://www.webpagetest.org) and fetch scores, numbers and waterfall images.

    require 'susuwatari'
    mei = Susuwatari.new( url: 'google.com' )
    mei.run
    mei.score[:cache_score]
    => 98
    mei.data[:number_of_requests]
    => 12
    mei.data[:time_to_first_byte]
    => 0.68


So why Susuwatari?
---

Premature optimization might be the root of all evil, but optimizing actual performance bottlenecks is uniquely satisfying. 

Optimizing a web page from the end user perspective is even more satisfying, so we figured we need a way to monitor the web page speed on a regular basis. 

This gem allows to you test your url using webpagetest.org and get all the relevant numbers (imho) in a structured form. Looking at the waterfall charts allows you to squash all those little nasty dust bunnies that will slow down your page.

![Squashing Susuwatari](http://dl.dropbox.com/u/3878602/ToShare/lk6r97NoeA1qzgeh8o1_500.gif "Squashing Susuwatari")

So how to use it?
---
You need an api key from webpagetest.org to use this gem. You can find more information about that on the [Developer Interfaces Documentation](https://sites.google.com/a/webpagetest.org/docs/advanced-features). 

Once you've installed the gem, you can use it like this:

    require 'susuwatari'
    Susuwatari.api_key = 'your-api-key'

    results = Susuwatari.new( url: 'google.com', from: 'detroit', using: 'Chrome' )
    results.run
    => :running

	results.status
    => :finished

    results.keys
    => [ :cache_score, :first_view_waterfall_url, :load_time, :time_to_first_byte, :dom_elements, …]


