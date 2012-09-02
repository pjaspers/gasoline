module Gasoline
  # A drop of Gasoline is a glorified hash that knows how to
  # retrieve the javascript needed to make the Campfire even
  # shinier.
  #
  # Since Github's gists are pretty much the easiest way to
  # share pieces of code, Drop uses them for all things JS.
  class Drop

    attr_accessor :name, :url, :description

    def initialize(name, url, description)
      @name = name
      @url = url
      @description = description
    end

    def to_s
      "%s: %s" % [@name, @description]
    end

    def to_hash
      {:name => @name, :url => @url, :description => @description}
    end

    # Takes the hash as usually found in the Jerrycan and
    # creates a drop from it.
    #
    # Returns a Drop
    def self.new_from_yml(hash)
      new(hash[:name], hash[:url], hash[:description])
    end

    # Returns the raw url for the specified gist
    def raw_gist_url
      @url.gsub("gist.github.com/", "raw.github.com/gist/")
    end

    # Returns the javascript from the gist URL.
    def download_content
      puts "Downloading #{@name} (#{@url})"
      open(raw_gist_url).read
    end

    # The header that will be displayed above the drop in the
    # patched file.
    #
    # Returns a String
    def header
  <<HEADER
/*
 * #{@name}
 * #{@description}
 *
 */
HEADER
end

    # Fetches the JS content and adds a header to it, ready to be
    # inserted in the patchor file.
    #
    # force_refresh - true will redownload the JS
    #
    # Returns a String
    def patch(force_refresh = false)
      @js ||= download_content
      @js = download_content if force_refresh

      <<PATCH

#{header}
#{@js}

// console.log("Loaded #{@name}");
PATCH
    end

  end

end
