require "helper"

describe Gasoline::Jerrycan do

  before do
    Gasoline::Jerrycan.any_instance.stubs(:save).returns(true)
    Gasoline::Jerrycan.any_instance.stubs(:bootstrap).returns(true)
    yaml = File.join(File.dirname(__FILE__), "example_drops.yml")
    Gasoline::Jerrycan.any_instance.stubs(:yaml_file).returns(yaml)
  end

  describe "loading drops" do
    before do
      @jerry = Gasoline::Jerrycan.new
    end

    it "should load drops from config file on init" do
      assert_equal 1, @jerry.drops.count
    end

    it "should load name for drops from config" do
      assert_equal "Sounds", @jerry.drops.first.name
    end
  end
end
