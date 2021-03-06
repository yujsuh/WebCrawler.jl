module WebCrawler

using Dates

# public interface
export Target
export add_site!, crawl_sites!, current_sites, reset_crawler!

# == insert global variables and functins here ==
Base.@kwdef mutable struct Target
    url::String
    finished::Bool = false
    finish_time::Union{DateTime,Nothing} = nothing
end

const sites = Target[]

function add_site!(site::Target)
    push!(sites, site)
end

function crawl_sites!()
    for s in sites
        index_site!(s)
    end
end

function current_sites()
    copy(sites)
end

function index_site!(site::Target)
    site.finished = true
    site.finish_time = now()
    println("Site $(site.url) crawled.")
end

function reset_crawler!()
    empty!(sites)
end



end
