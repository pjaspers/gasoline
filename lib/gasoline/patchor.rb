module Gasoline
  # The Patchor will do all the patching on the Propane support
  # file, it finds (and creates if needed) the file, adds the
  # Propane header, and then adds all the drops from the jerrycan.
  class Patchor
    PATCHOR_FILE = "#{ENV['HOME']}/Library/Application Support/Propane/unsupported/caveatPatchor.js"

    def initialize
      @lines = []
      bootstrap
      load_lines
    end

    def patchor_file
      PATCHOR_FILE
    end

    # Will create the Propane, caveatPatchor.js file
    def bootstrap
      return if File.exist?(patchor_file)

      FileUtils.mkdir_p(File.split(patchor_file).first)
      FileUtils.touch(patchor_file)
      File.open(patchor_file, "w") do |f|
        f.write(Gasoline::Texts::propane_header)
      end
    end

    # Current lines in memory
    #
    # Returns an array of lines
    def lines
      @lines
    end

    # Loads the entire file into memory
    def load_lines
      @lines = File.readlines(patchor_file)
    end

    # The index of the line matching the cut snippet, if it can't
    # be found we'll take the last line.
    #
    # Returns an int
    def cut_line_index
      @lines.find_index{|line| line =~ /#{Gasoline::Texts::cut_here_line}/} || @lines.length
    end

    # An instance of the Jerrycan, mainly added to have quick
    # access to it, while developing.
    #
    # Returns a `Jerrycan` instance
    def jerrycan
      @jerrycan ||= Gasoline::Jerrycan.new
    end

    # The contents of our Jerrycan, laid bare to be patched.
    #
    # Returns an array of `Drop`s
    def drops
      jerrycan.drops
    end

    # Transform the @lines to have:
    #
    #     1. All the lines above the cut
    #     2. The cut here snippet
    #     3. All patches from the drops. (will download them)
    #
    # Returns an array of lines
    def patch_it_chewie
      to_keep = @lines[0...cut_line_index]
      snippet = [Gasoline::Texts::cut_here_snippet]
      to_add = drops.collect(&:patch).compact
      @lines = (to_keep + snippet + to_add)
    end

    # First fills up the @lines instance, then saves the file
    def patch_it_chewie!
      patch_it_chewie
      Gasoline::Applescript.refresh_propane_if_running
      save
    end

    # Writes the file to disk.
    def save
      File.open("file.tmp", "w") {|f| f.write(@lines.join(""))}
      FileUtils.mv("file.tmp", patchor_file)
    end
  end
end
