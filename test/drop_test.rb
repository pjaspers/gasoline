require "helper"

describe Gasoline::Drop do

  describe "basic setup" do
    before do
      @drop = Gasoline::Drop.new("Fire", "http://water.com", "Burn")
    end

    it "should have a name" do
      assert_equal "Fire", @drop.name
    end

    it "should have a url" do
      assert_equal "http://water.com", @drop.url
    end

    it "should have a description" do
      assert_equal "Burn", @drop.description
    end
  end

  describe "loading from hash" do
    before do
      @h = {
      :name => "Fire",
      :url => "http://water.com",
      :description => "Desc"
      }
      @drop = Gasoline::Drop.new_from_yml(@h)
    end

    [:name, :url, :description].each do |s|
      it "should have a #{s}" do
        assert_equal @h[s], @drop.send(s)
      end
    end
  end

  describe "getting the content" do
    before do
      @url = "https://gist.github.com/3258692"
      @drop = Gasoline::Drop.new("xyz", @url, "zyx")
    end

    it "should get the raw gist url" do
      assert_equal "https://raw.github.com/gist/3258692", @drop.raw_gist_url
    end

    it "should set header with name" do
      assert_match "xyz", @drop.header
    end

    it "should set header with description" do
      assert_match "zyx", @drop.description
    end

    it "should return nil if there was any error fetching it" do
      @drop.stubs(:download_content).raises(StandardError, 'some error probably 404')
      assert_nil @drop.patch
    end

    it "should try to download when asked for patch" do
      @drop.expects(:download_content).returns("ZE JS CONTENT")
      assert_match "ZE JS", @drop.patch
    end
  end
end
