require "helper"

describe Gasoline::Patchor do

  before do
    Gasoline::Patchor.any_instance.stubs(:save).returns(true)
    Gasoline::Patchor.any_instance.stubs(:bootstrap).returns(true)

    js = File.join(File.dirname(__FILE__), "patchor.js")
    Gasoline::Patchor.any_instance.stubs(:patchor_file).returns(js)
  end

  describe "loading patchor" do
    before do
      @patchor = Gasoline::Patchor.new
    end

    it "should load the js file into lines" do
      assert @patchor.lines.count > 1
    end

  end

  describe "patching the patch" do
    before do
      @patchor = Gasoline::Patchor.new
      drop = mock()
      drop.expects(:patch).returns("ZE PATCH")
      @patchor.expects(:drops).returns([drop])
    end

    it "should download the patches and add them to lines" do
      @patchor.patch_it_chewie
      assert @patchor.lines.include?("ZE PATCH")
    end

  end
end
