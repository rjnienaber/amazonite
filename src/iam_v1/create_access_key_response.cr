module Amazonite::IamV1
  # Contains the response to a successful
  # [CreateAccessKey](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateAccessKey.html)
  # request.
  class CreateAccessKeyResponse
    # A structure with details about the access key.
    property access_key : AccessKey

    def initialize(
      @access_key : AccessKey,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@access_key.to_query_params("#{prefix}AccessKey."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        access_key: node.xpath_node("*[local-name()='AccessKey']").try { |n| AccessKey.from_xml(n) }.not_nil!,
      )
    end
  end
end
