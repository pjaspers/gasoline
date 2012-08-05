module Gasoline
  # Gasoline drops are stored in a Jerrycan (safety first), in this case
  # it is disguised as a yaml file, stored in the users' home folder.
  #
  # Not directly in the home folder but in the `.config/gasoline` folder,
  # since [Rob doesn't like them there](https://plus.google.com/101960720994009339267/posts/R58WgWwN9jp)
  # and he seems to know this UNIX thingie.

  class Jerrycan
    YAML_FILE = "#{ENV['HOME']}/.config/gasoline/drops.yml"

    attr_writer :drops

    def initialize
      @drops = []
      bootstrap
      add_drops(YAML.load_file(yaml_file)[:drops]) rescue nil
    end

    # Adds a drop of gasoline to the jerrycan
    #
    # drop - A Gasoline::Drop instance
    #
    # Returns the current list of drops
    def add_drop(drop)
      @drops << drop
    end

    # Takes an array of hashes and fills the can with `Drop`s
    #
    # Hash should be:
    #       {:name => "k", :url => "url", :description => "desc"}
    #
    # Returns nothing
    def add_drops(array)
      array.each do |h|
        add_drop Gasoline::Drop.new_from_yml(h)
      end
    end

    def yaml_file
      YAML_FILE
    end

    # Will create the config file (if needed)
    def bootstrap
      return if File.exist?(yaml_file)

      FileUtils.mkdir_p(File.split(yaml_file).first)
      FileUtils.touch(yaml_file)
      save
    end

    # All the `Drop`s in this Jerrycan.
    #
    # Returns an array of `Drop`s
    def drops
      @drops
    end

    # Goes through all the drops and squeezes a hash out of them
    # then cunningly makes a yaml out of those.
    #
    # Returns a yaml (as a String)
    def to_yaml
      {:drops => drops.collect(&:to_hash)}.to_yaml
    end

    # Writes the can to the yaml config file.
    def save
      File.open(yaml_file, 'w') {|f| f.write(to_yaml) }
    end

    # Mainly used to quickly load the hash I used previously back
    # when this was just a onefile script. Those were the days.
    #
    # Returns a Jerrycan
    def self.load_from_array(array)
      can = new
      can.add_drops(array)
      can
    end

  end
end
