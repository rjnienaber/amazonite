private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListInstanceProfilesRequest
    # The path prefix for filtering the results. For example, the prefix
    # `/application_abc/component_xyz/` gets all instance profiles whose path starts with
    # `/application_abc/component_xyz/`.
    #
    # This parameter is optional. If it is not included, it defaults to a slash (/), listing all
    # instance profiles. This parameter allows (through its [regex
    # pattern](http://wikipedia.org/wiki/regex)) a string of characters consisting of either a forward
    # slash (/) by itself or a string that must begin and end with forward slashes. In addition, it
    # can contain any ASCII character from the ! (`\u0021`) through the DEL character (`\u007F`),
    # including most punctuation characters, digits, and upper and lowercased letters.
    property path_prefix : String | Nil

    # Use this parameter only when paginating results and only after you receive a response indicating
    # that the results are truncated. Set it to the value of the `Marker` element in the response that
    # you received to indicate where the next call should start.
    property marker : String | Nil

    # Use this only when paginating results to indicate the maximum number of items you want in the
    # response. If additional items exist beyond the maximum you specify, the `IsTruncated` response
    # element is `true`.
    #
    # If you do not include this parameter, the number of items defaults to 100. Note that IAM might
    # return fewer results, even when there are more results available. In that case, the
    # `IsTruncated` response element returns `true`, and `Marker` contains a value to include in the
    # subsequent call that tells the service where to continue from.
    property max_items : Int32 | Nil

    def initialize(
      @path_prefix : String | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @path_prefix
        params << {"#{prefix}PathPrefix", value}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end

      if value = @max_items
        params << {"#{prefix}MaxItems", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='PathPrefix']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
      )
    end
  end
end
