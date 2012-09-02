module Gasoline
  class Applescript
    # Runs a piece of Applescript,
    #
    #      Gasoline::Applescript.run do
    #        "set ten_and_ten to 10 + 10"
    #      end
    #      => "20"
    #
    # Since Applescript has a nasy bit of littering its
    # return values with `\n`, already escaping those.
    def self.run
      value = `/usr/bin/osascript -e "#{yield.gsub('"', '\"')}"`
      value.gsub("\n", '')
    end

    # Checks if Propane is currently running
    #
    # Returns a bool
    def self.propane_running?
      running = run {'tell application "System Events" to (name of processes) contains "Propane"'}
      running == "true"
    end

    # If Propane is running, this will send it a refresh command
    #
    # Returns a string
    def self.refresh_propane_if_running
      return unless propane_running?

      script = <<SCRIPT
tell application "Propane"
	activate
	tell application "System Events"
		# Refresh current room
		keystroke "r" using command down
	end tell
end tell
SCRIPT

      run { script }
    end
  end
end
