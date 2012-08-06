require "thor"

module Gasoline
  # [thor](http://github.com/wycats/thor)
  class CLI < Thor
    include Thor::Actions

    map "-i" => :ignite
    map "-a" => :add
    map "-l" => :list
    map "-c" => :config

    desc "ignite", "Downloads and patches the file"
    def ignite
      Gasoline::Patchor.new.patch_it_chewie!
      say_status :ok,  "I have patched the patch file"
    end

    desc "list", "-l, Current installed drops of gasoline"
    def list
      first_line = ["Currently using these drops of gasoline:"]
      installed_drops = Gasoline::Patchor.new.drops.collect(&:to_s)
      say (first_line + installed_drops).join("\n\t- ")
    end

    desc "add NAME URL description", "-a, Adds a drop to the config"
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
