module Amazonite::IamV1
  class GetLoginProfileResponse
    property login_profile : LoginProfile

    def initialize(
      @login_profile : LoginProfile,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@login_profile.to_query_params("#{prefix}LoginProfile."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        login_profile: node.xpath_node("*[local-name()='LoginProfile']").try { |n| LoginProfile.from_xml(n) }.not_nil!,
      )
    end
  end
end
