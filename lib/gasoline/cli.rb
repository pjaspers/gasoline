require "thor"

module Gasoline
  # [thor](http://github.com/wycats/thor)
  class CLI < Thor
    include Thor::Actions

    map "-i" => :ignite
    map "-l" => :list
    map "-m" => :more
    map "-c" => :config

    desc "ignite", "-i, Patches the file with the contents of the config"
    def ignite
      Gasoline::Patchor.new.patch_it_chewie!
      say "I have patched the patch file"
    end

    desc "list", "-l, Current installed drops of gasoline"
    def list
      installed_drops = Gasoline::Patchor.new.drops.collect{|d| "\t- #{d.name} - #{d.description}"}.join("\n")
      say "Currently using these drops of gasoline:\n#{installed_drops}"
    end

    desc "more", "-m, Show remote configs"
    def more
      say "TODO"
    end

    desc "add NAME URL description", "Adds a drop to the config"
    def add(name, url, description)
      can = Gasoline::Jerrycan.new
      can.add_drops([{:name => name, :url => url, :description => description}])
      can.save
      say "Added #{name} - #{url}"
    end

    desc "config", "-c, Shows current config"
    def config
      say File.open(Gasoline::Jerrycan::YAML_FILE).read
    end
  end
end
