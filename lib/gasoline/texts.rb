module Gasoline
  module Texts
    class << self
      def cut_here_line
        "_.:Gasoline Snippet:._"
      end

      def cut_here_snippet
        <<SNIPPET
//#{cut_here_line}
//
// Anything below this line will be replaced by the gasoline gem.
//

SNIPPET
      end

      def propane_header
        <<HEADER
/*
 As of version 1.1.2, Propane will load and execute the contents of
 ~Library/Application Support/Propane/unsupported/caveatPatchor.js
 immediately following the execution of its own enhancer.js file.

 You can use this mechanism to add your own customizations to Campfire
 in Propane.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

HEADER
      end
    end
  end
end
